execute as @e[type=item_frame,tag=world_brush] at @s run function world_brush:zzz/brush/tick

execute as @a if items entity @s weapon.mainhand item_frame[item_name="World Brush"] run function world_brush:zzz/player/tick_mainhand
execute as @a if items entity @s weapon.offhand item_frame[item_name="World Brush"] unless items entity @s weapon.mainhand * at @s run function world_brush:zzz/player/tick_offhand