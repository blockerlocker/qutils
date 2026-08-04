import os, urllib.request, json, sys, shutil, zipfile
from pathlib import Path
from PIL import Image


if len(sys.argv) > 1:
    MCVERSION = sys.argv[1]
else:
#### SET MINECRAFT VERSION MANUALLY HERE ####
    MCVERSION = "26.3-snapshot-6"


os.chdir(os.path.dirname(os.path.abspath(__file__)))

print("--Setting up temporary directory")
TEMPORARY_DIRECTORY = "sprite_display_datagen_temp_dir"
shutil.rmtree(TEMPORARY_DIRECTORY, ignore_errors=True)
Path(TEMPORARY_DIRECTORY).mkdir(parents=True, exist_ok=True)

print("--Grabbing version manifest")
version_manifest = json.load(urllib.request.urlopen("https://piston-meta.mojang.com/mc/game/version_manifest_v2.json"))

version = next((item for item in version_manifest["versions"] if item["id"] == MCVERSION), None)

if version == None:
    print("MCVERSION does not exist in version manifest!")
    sys.exit()

print(f"--Downloading client.jar for {MCVERSION}")
version_info = json.load(urllib.request.urlopen(version["url"]))
version_server = version_info["downloads"]["client"]["url"]
urllib.request.urlretrieve(version_server,f"{TEMPORARY_DIRECTORY}/client.jar")

print("--Unpacking from client.jar")
with zipfile.ZipFile(f"{TEMPORARY_DIRECTORY}/client.jar","r") as jar:
    files_to_extract = [item for item in jar.namelist() if item.startswith(("assets/minecraft/atlases/", "assets/minecraft/textures/"))]
    jar.extractall(path=TEMPORARY_DIRECTORY,members=files_to_extract)

print("--Getting atlas paths")
atlas_dir = f"{TEMPORARY_DIRECTORY}/assets/minecraft/atlases/"
all_atlas_sources = []
for file in os.listdir(atlas_dir):
    atlas_name = file.replace(".json","")
    with open(f"{atlas_dir}/{file}", "r") as atlas_json:
        atlas = json.load(atlas_json)
    for atlas_source in atlas["sources"]:
        atlas_source["atlas_name"] = atlas_name
        all_atlas_sources.append(atlas_source)

print("--Building sprite map")
texture_dir = f"{TEMPORARY_DIRECTORY}/assets/minecraft/textures/"
sprite_data = {}
display_sprites = []
for atlas_source in all_atlas_sources:
    atlas = atlas_source["atlas_name"]
    if not atlas in sprite_data: sprite_data[atlas] = {}

    prefix = ""
    if "prefix" in atlas_source:
        prefix = atlas_source["prefix"]

    if atlas_source["type"] == "minecraft:directory":
        source = str(atlas_source["source"])
        source_path = f"{texture_dir}/{source}"
        for texture in Path(source_path).rglob("*"):
            if texture.is_file() and str(texture).endswith(".png"):
                with Image.open(texture) as image:
                    width, height = image.size

                if Path(f"{texture}.mcmeta").is_file():
                    with open(f"{texture}.mcmeta", "r") as mcmeta_json:
                        mcmeta = json.load(mcmeta_json)
                        if "animation" in mcmeta:
                            height = width
                            if "height" in mcmeta["animation"]:
                                height = mcmeta["animation"]["height"]
                
                strip_dir = source_path.replace("//","/") + "/"
                sprite_name = str(texture).replace("\\","/").replace(strip_dir,"").replace(".png","")
                sprite_data[atlas][f"{prefix}{sprite_name}"] = {"atlas":atlas,"sprite":f"{prefix}{sprite_name}","width":width,"height":height,"scale":1}
                display_sprites.append({"storage":"sprite_display:sprite_data","nbt":f"{atlas}.'{prefix}{sprite_name}'","interpret":True,"shadow_color":0,"click_event":{"action":"suggest_command","command":f"/function sprite_display:summon with storage sprite_display:sprite_data {atlas}.'{prefix}{sprite_name}'"}})

print("--Creating load.mcfunction")
Path("data/sprite_display/function").mkdir(parents=True,exist_ok=True)
with open("data/sprite_display/function/load.mcfunction", "w") as load:
    load.write(f"data merge storage sprite_display:sprite_data {sprite_data}")

print("--Creating browse_sprites.mcfunction")
Path("data/sprite_display/function").mkdir(parents=True,exist_ok=True)
with open("data/sprite_display/function/browse_sprites.mcfunction", "w") as load:
    load.write(f"tellraw @s {display_sprites}")

print("--Removing temporary directory")
shutil.rmtree(TEMPORARY_DIRECTORY, ignore_errors=True)