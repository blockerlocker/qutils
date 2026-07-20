data modify storage command_chain_editor:temp all.command_list set from block ~ ~ ~ Command
data modify storage command_chain_editor:temp all.command set from block ~ ~ ~ Command

execute unless data storage command_chain_editor:temp all{command:""} run function command_chain_editor:zzz/construct/newline with storage command_chain_editor:temp all

data modify storage command_chain_editor:temp all.command set value ''

summon marker ~ ~ ~ {Tags:[command_chain_editor_root]}

data modify storage command_chain_editor:temp all.root_x set from entity @n[type=marker,tag=command_chain_editor_root] Pos[0]
data modify storage command_chain_editor:temp all.root_y set from entity @n[type=marker,tag=command_chain_editor_root] Pos[1]
data modify storage command_chain_editor:temp all.root_z set from entity @n[type=marker,tag=command_chain_editor_root] Pos[2]

kill @n[type=marker,tag=command_chain_editor_root]

execute if block ~ ~ ~ #command_chain_editor:command_root[facing=south] positioned ~ ~ ~1 run function command_chain_editor:zzz/construct/loop
execute if block ~ ~ ~ #command_chain_editor:command_root[facing=north] positioned ~ ~ ~-1 run function command_chain_editor:zzz/construct/loop
execute if block ~ ~ ~ #command_chain_editor:command_root[facing=east] positioned ~1 ~ ~ run function command_chain_editor:zzz/construct/loop
execute if block ~ ~ ~ #command_chain_editor:command_root[facing=west] positioned ~-1 ~ ~ run function command_chain_editor:zzz/construct/loop
execute if block ~ ~ ~ #command_chain_editor:command_root[facing=up] positioned ~ ~1 ~ run function command_chain_editor:zzz/construct/loop
execute if block ~ ~ ~ #command_chain_editor:command_root[facing=down] positioned ~ ~-1 ~ run function command_chain_editor:zzz/construct/loop

data remove storage command_chain_editor:temp all

kill @s