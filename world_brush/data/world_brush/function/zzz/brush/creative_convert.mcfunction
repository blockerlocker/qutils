advancement revoke @s only world_brush:use_brush_creative

playsound block.shelf.multi_swap ui @s ~ ~ ~ 1 2

execute anchored eyes run particle minecraft:firework ^ ^-0.25 ^0.25 0 0 0 0.1 10

loot replace entity @s weapon.mainhand loot world_brush:world_brush