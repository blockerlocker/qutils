$data modify storage command_chain_editor:temp all.command_list set value '$(command_list)'
data modify storage command_chain_editor:temp all.command set value ''
data modify storage command_chain_editor:temp all.current_char set string storage command_chain_editor:temp all.command_list 0 1

function command_chain_editor:zzz/save/split_loop with storage command_chain_editor:temp all

data modify block ~ ~ ~ Command set from storage command_chain_editor:temp all.save_commands[0]
data remove storage command_chain_editor:temp all.save_commands[0]

execute if block ~ ~ ~ #command_chain_editor:command_root[facing=south] run data modify storage command_chain_editor:temp all.last_facing set value south
execute if block ~ ~ ~ #command_chain_editor:command_root[facing=north] run data modify storage command_chain_editor:temp all.last_facing set value north
execute if block ~ ~ ~ #command_chain_editor:command_root[facing=east] run data modify storage command_chain_editor:temp all.last_facing set value east
execute if block ~ ~ ~ #command_chain_editor:command_root[facing=west] run data modify storage command_chain_editor:temp all.last_facing set value west
execute if block ~ ~ ~ #command_chain_editor:command_root[facing=up] run data modify storage command_chain_editor:temp all.last_facing set value up
execute if block ~ ~ ~ #command_chain_editor:command_root[facing=down] run data modify storage command_chain_editor:temp all.last_facing set value down

execute if block ~ ~ ~ #command_chain_editor:command_root[facing=south] positioned ~ ~ ~1 run function command_chain_editor:zzz/save/store_command_loop with storage command_chain_editor:temp all
execute if block ~ ~ ~ #command_chain_editor:command_root[facing=north] positioned ~ ~ ~-1 run function command_chain_editor:zzz/save/store_command_loop with storage command_chain_editor:temp all
execute if block ~ ~ ~ #command_chain_editor:command_root[facing=east] positioned ~1 ~ ~ run function command_chain_editor:zzz/save/store_command_loop with storage command_chain_editor:temp all
execute if block ~ ~ ~ #command_chain_editor:command_root[facing=west] positioned ~-1 ~ ~ run function command_chain_editor:zzz/save/store_command_loop with storage command_chain_editor:temp all
execute if block ~ ~ ~ #command_chain_editor:command_root[facing=up] positioned ~ ~1 ~ run function command_chain_editor:zzz/save/store_command_loop with storage command_chain_editor:temp all
execute if block ~ ~ ~ #command_chain_editor:command_root[facing=down] positioned ~ ~-1 ~ run function command_chain_editor:zzz/save/store_command_loop with storage command_chain_editor:temp all

data remove storage command_chain_editor:temp all