import os, json, shutil, urllib.request, zipfile, colorsys
from pathlib import Path
from PIL import Image

os.chdir(os.path.dirname(os.path.abspath(__file__)))

def get_version(mcversion):
    version_manifest = json.load(urllib.request.urlopen("https://piston-meta.mojang.com/mc/game/version_manifest_v2.json"))
    if mcversion == "latest-release":
        return version_manifest["latest"]["release"]
    elif mcversion == "latest-snapshot":
        return version_manifest["latest"]["snapshot"]
    else:
        return mcversion

def get_registry_data(mcversion,registry):
    registry_response = urllib.request.urlopen(f"https://raw.githubusercontent.com/misode/mcmeta/{mcversion}-registries/{registry}/data.json")
    return(json.load(registry_response))

def unpack_client(mcversion,temp_dir,extract_paths):
    if not Path(temp_dir).is_dir():
        print("--Setting up temporary directory")
        shutil.rmtree(temp_dir, ignore_errors=True)
        Path(temp_dir).mkdir(parents=True, exist_ok=True)

    print("--Grabbing version manifest")
    version_manifest = json.load(urllib.request.urlopen("https://piston-meta.mojang.com/mc/game/version_manifest_v2.json"))

    version = next((item for item in version_manifest["versions"] if item["id"] == mcversion), None)

    if version == None:
        print(f"--{mcversion} does not exist in version manifest!")
        return(None)

    print(f"--Downloading client.jar for {mcversion}")
    version_info = json.load(urllib.request.urlopen(version["url"]))
    version_server = version_info["downloads"]["client"]["url"]
    urllib.request.urlretrieve(version_server,f"{temp_dir}/client.jar")

    print("--Unpacking from client.jar")
    with zipfile.ZipFile(f"{temp_dir}/client.jar","r") as jar:
        files_to_extract = [item for item in jar.namelist() if item.startswith(extract_paths)]
        jar.extractall(path=temp_dir,members=files_to_extract)

def remove_path(path):
    if Path(path).exists():
        if Path(path).is_dir(): shutil.rmtree(path,ignore_errors=True)
        elif Path(path).is_file(): os.remove(path)
        print(f"--Removed {path}")

def string_to_file(string,path,file_name):
    Path(path).mkdir(parents=True, exist_ok=True)

    if not path[-2:-1] in ["/", "\\"]:
        path += "/"

    with open(path+file_name, "w", encoding="utf-8") as output_file:
        output_file.write(string)

def json_to_file(json_object,path,file_name):
    Path(path).mkdir(parents=True, exist_ok=True)

    if not path[-2:-1] in ["/", "\\"]:
        path += "/"

    if not file_name[-5:] == ".json":
            file_name += ".json"

    with open(f"{path}{file_name}", "w", encoding="utf-8") as output_file:
        json.dump(json_object,output_file,indent=4)

def mcfunction_append(path,function,command):
    if not path[-2:-1] in ["/", "\\"]:
        file_path = f"{path}/{function}.mcfunction"
    else:
        file_path = f"{path}{function}.mcfunction"

    if Path(file_path).is_file():
        with open(file_path, "r", encoding="utf-8") as mcfunction:
            mcfunction_contents = mcfunction.read()

            if not command in mcfunction_contents:
                mcfunction_contents += f"\n{command}"
                with open(file_path, "w", encoding="utf-8") as new_mcfunction:
                    new_mcfunction.write(mcfunction_contents)
    else:
        string_to_file(command,path,f"{function}.mcfunction")

def tag_append(path,tag,append_value):
    if not path[-2:-1] in ["/", "\\"]:
        file_path = f"{path}/{tag}.json"
    else:
        file_path = f"{path}{tag}.json"
    
    if Path(file_path).is_file():
        with open(file_path, "r", encoding="utf-8") as tag_json:
            new_tag = json.load(tag_json)
            if not append_value in new_tag["values"]:
                new_tag["values"].append(append_value)
                with open(file_path, "w") as new_tag_json:
                    json.dump(new_tag,new_tag_json,indent=4)
    else:
        Path(path).mkdir(parents=True, exist_ok=True)

        new_tag = {"values":[append_value]}

        with open(file_path, "w") as new_tag_json:
            json.dump(new_tag,new_tag_json,indent=4)

def average_color(file_name):
    total_red = 0
    total_blue = 0
    total_green = 0
    counted_pixels = 0

    raw_texture = Image.open(file_name)
    rgb_texture = raw_texture.convert('RGBA')
    width, height = rgb_texture.size

    for x in range(0, width):
        for y in range(0, height):
            r, g, b, a = rgb_texture.getpixel((x,y))

            if not a == 0:
                total_red += r * (255/a)
                total_green += g * (255/a)
                total_blue += b * (255/a)
                counted_pixels += 1

    if not counted_pixels == 0:
        avg_red = round(total_red / counted_pixels)
        avg_green = round(total_green / counted_pixels)
        avg_blue = round(total_blue / counted_pixels)

        return((avg_red,avg_green,avg_blue))
    else:
        return((0,0,0))