import os, urllib.request, json, sys, shutil
from pathlib import Path
from PIL import Image


if len(sys.argv) > 1:
    MCVERSION = sys.argv[1]
else:
#### SET MINECRAFT VERSION MANUALLY HERE ####
    MCVERSION = "latest-snapshot"


os.chdir(os.path.dirname(os.path.abspath(__file__)))

if not Path.cwd().name == "data":
    print(f"Working directory not named 'data'! Instead got '{Path.cwd().name}'. bldp generation scripts must be stored within the 'data' folder of your pack to generate correctly!")
    input("Press Enter to exit program...")
    sys.exit()

if not Path("bldp.py").is_file():
    with open("bldp.py", "w", encoding="utf-8") as bldp_main:
        bldp_main.write(urllib.request.urlopen("https://raw.githubusercontent.com/blockerlocker/bldp/main/data/bldp.py").read().decode('utf-8'))

import bldp

MCVERSION = bldp.get_version(MCVERSION)

print("--Setting up temporary directory")
TEMP_DIR = "sprite_display_datagen_temp_dir"
shutil.rmtree(TEMP_DIR, ignore_errors=True)
Path(TEMP_DIR).mkdir(parents=True, exist_ok=True)

bldp.unpack_client(MCVERSION,TEMP_DIR,("assets/minecraft/atlases", "assets/minecraft/textures"))

print("--Getting atlas paths")
atlas_dir = f"{TEMP_DIR}/assets/minecraft/atlases/"
all_atlas_sources = []
for file in os.listdir(atlas_dir):
    atlas_name = file.replace(".json","")
    with open(f"{atlas_dir}/{file}", "r") as atlas_json:
        atlas = json.load(atlas_json)
    for atlas_source in atlas["sources"]:
        atlas_source["atlas_name"] = atlas_name
        all_atlas_sources.append(atlas_source)

print("--Building sprite map")
def process_texture(texture,source_path):
    with Image.open(texture) as image:
        width, height = image.size

    if Path(f"{texture}.mcmeta").is_file():
        with open(f"{texture}.mcmeta", "r") as mcmeta_json:
            mcmeta = json.load(mcmeta_json)
            if "animation" in mcmeta:
                height = width
                if "height" in mcmeta["animation"]:
                    height = mcmeta["animation"]["height"]

    baked_width = width * 0.3125
    baked_height = height * 0.3125
    baked_x_translation = baked_width * -0.025
    baked_y_translation = baked_height * -0.15
        
    strip_dir = source_path.replace("//","/") + "/"
    sprite_name = str(texture).replace("\\","/").replace(strip_dir,"").replace(".png","")
    sprite_data[atlas][f"{prefix}{sprite_name}"] = {"atlas":atlas,"sprite":f"{prefix}{sprite_name}","width":width,"height":height,"scale":1}
    browse_sprites.append({"atlas":f"{atlas}","sprite":f"{prefix}{sprite_name}","shadow_color":0,"click_event":{"action":"suggest_command","command":f"/summon text_display ~ ~ ~ {{Tags:[sprite_display],background:0,transformation:[{baked_width},0,0,{baked_x_translation},0,{baked_height},0,{baked_y_translation},0,0,1,0,0,0,0,1],data:{{sprite_size:[{width},{height}]}},text:{{atlas:'{atlas}',sprite:'{prefix}{sprite_name}'}}}}"},"hover_event":{"action":"show_text","value":[{"text":f"Summon {prefix}{sprite_name}","color":"aqua"},{"text":f"\natlas: {atlas}","color":"gray","italic":True}]}})
    debug_sprites.append({"storage":"sprite_display:sprite_data","nbt":f"{atlas}.'{prefix}{sprite_name}'","interpret":True})

texture_dir = f"{TEMP_DIR}/assets/minecraft/textures"
sprite_data = {}
browse_sprites = []
debug_sprites = []
for atlas_source in all_atlas_sources:
    atlas = atlas_source["atlas_name"]
    if not atlas in sprite_data: sprite_data[atlas] = {}

    prefix = ""
    if "prefix" in atlas_source:
        prefix = atlas_source["prefix"]

    if atlas_source["type"] == "minecraft:directory":
        source = str(atlas_source["source"])
        source_path = f"{texture_dir}/{source}"
        for texture in Path(source_path).rglob("*") :
            if texture.is_file() and str(texture).endswith(".png"):
                process_texture(texture,source_path)

    if atlas_source["type"] == "minecraft:single":
        source = str(atlas_source["resource"]).replace("minecraft:","")
        process_texture(Path(f"{texture_dir}/{source}.png"),f"{texture_dir}")

bldp.string_to_file(f"data merge storage sprite_display:sprite_data {sprite_data}","sprite_display/function","load.mcfunction")
bldp.string_to_file(f"dialog show @s {{type:notice,title:\"Sprite Display Browser\",body:{{type:plain_message,width:500,contents:{browse_sprites}}}}}","sprite_display/function","browse.mcfunction")
bldp.string_to_file(f"summon text_display ~ ~ ~ {{Tags:[sprite_display],background:0,shadow:false,line_width:640,data:{{sprite_size:[1,1]}},text:{browse_sprites}}}","sprite_display/function","debug_entity.mcfunction")

bldp.remove_path(TEMP_DIR)