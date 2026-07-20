advancement revoke @s only command_viz:use

tag @s add command_viz_use

execute as @n[type=item_frame,nbt={data:{command_viz:true}}] at @s positioned ^ ^ ^-0.5 align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ chain_command_block run function command_viz:zzz/find_origin
execute as @n[type=item_frame,nbt={data:{command_viz:true}}] at @s positioned ^ ^ ^-0.5 align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ #command_viz:command_root run function command_viz:zzz/loop

tag @s remove command_viz_use

kill @e[type=item_frame,nbt={data:{command_viz:true}}]