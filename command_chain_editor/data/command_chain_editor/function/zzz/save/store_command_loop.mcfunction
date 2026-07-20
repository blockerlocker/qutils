$execute unless block ~ ~ ~ chain_command_block run setblock ~ ~ ~ chain_command_block[facing=$(last_facing)]

data modify block ~ ~ ~ Command set from storage command_chain_editor:temp all.save_commands[0]
data remove storage command_chain_editor:temp all.save_commands[0]

execute unless data storage command_chain_editor:temp all.save_commands[0] run return 1

execute if block ~ ~ ~ chain_command_block[facing=south] run data modify storage command_chain_editor:temp all.last_facing set value south
execute if block ~ ~ ~ chain_command_block[facing=north] run data modify storage command_chain_editor:temp all.last_facing set value north
execute if block ~ ~ ~ chain_command_block[facing=east] run data modify storage command_chain_editor:temp all.last_facing set value east
execute if block ~ ~ ~ chain_command_block[facing=west] run data modify storage command_chain_editor:temp all.last_facing set value west
execute if block ~ ~ ~ chain_command_block[facing=up] run data modify storage command_chain_editor:temp all.last_facing set value up
execute if block ~ ~ ~ chain_command_block[facing=down] run data modify storage command_chain_editor:temp all.last_facing set value down

execute if block ~ ~ ~ chain_command_block[facing=south] positioned ~ ~ ~1 run return run function command_chain_editor:zzz/save/store_command_loop with storage command_chain_editor:temp all
execute if block ~ ~ ~ chain_command_block[facing=north] positioned ~ ~ ~-1 run return run function command_chain_editor:zzz/save/store_command_loop with storage command_chain_editor:temp all
execute if block ~ ~ ~ chain_command_block[facing=east] positioned ~1 ~ ~ run return run function command_chain_editor:zzz/save/store_command_loop with storage command_chain_editor:temp all
execute if block ~ ~ ~ chain_command_block[facing=west] positioned ~-1 ~ ~ run return run function command_chain_editor:zzz/save/store_command_loop with storage command_chain_editor:temp all
execute if block ~ ~ ~ chain_command_block[facing=up] positioned ~ ~1 ~ run return run function command_chain_editor:zzz/save/store_command_loop with storage command_chain_editor:temp all
execute if block ~ ~ ~ chain_command_block[facing=down] positioned ~ ~-1 ~ run return run function command_chain_editor:zzz/save/store_command_loop with storage command_chain_editor:temp all