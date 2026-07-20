advancement revoke @s only command_chain_editor:use

tag @s add command_chain_editor_use

execute as @n[type=item_frame,nbt={data:{command_chain_editor:true}}] at @s positioned ^ ^ ^-0.5 align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ chain_command_block run function command_chain_editor:zzz/find_origin
execute as @n[type=item_frame,nbt={data:{command_chain_editor:true}}] at @s positioned ^ ^ ^-0.5 align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ #command_chain_editor:command_root run function command_chain_editor:zzz/construct/init

tag @s remove command_chain_editor_use

kill @e[type=item_frame,nbt={data:{command_chain_editor:true}}]