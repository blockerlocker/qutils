tellraw @a "The alt-use of the Fill brush is currently not working in 26.3 and up, due to its relience on the blockstate library by Triton365, which still needs to be updated. Sorry!"

#execute positioned ^ ^ ^-0.5 run loot replace entity @s contents loot blockstate:get

#function world_brush:zzz/brush/alt_function/fill/modify_item with entity @s Item.components."minecraft:custom_data"

execute as @n[tag=world_brush_used] at @s run playsound minecraft:block.trial_spawner.eject_item ui @s