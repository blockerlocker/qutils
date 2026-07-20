data modify storage command_chain_editor:temp all.command set from block ~ ~ ~ Command
function command_chain_editor:zzz/construct/append_command with storage command_chain_editor:temp all
execute unless data storage command_chain_editor:temp all{command:""} run function command_chain_editor:zzz/construct/newline with storage command_chain_editor:temp all

execute if block ~ ~ ~ chain_command_block[facing=south] positioned ~ ~ ~1 if block ~ ~ ~ chain_command_block run return run function command_chain_editor:zzz/construct/loop
execute if block ~ ~ ~ chain_command_block[facing=north] positioned ~ ~ ~-1 if block ~ ~ ~ chain_command_block run return run function command_chain_editor:zzz/construct/loop
execute if block ~ ~ ~ chain_command_block[facing=east] positioned ~1 ~ ~ if block ~ ~ ~ chain_command_block run return run function command_chain_editor:zzz/construct/loop
execute if block ~ ~ ~ chain_command_block[facing=west] positioned ~-1 ~ ~ if block ~ ~ ~ chain_command_block run return run function command_chain_editor:zzz/construct/loop
execute if block ~ ~ ~ chain_command_block[facing=up] positioned ~ ~1 ~ if block ~ ~ ~ chain_command_block run return run function command_chain_editor:zzz/construct/loop
execute if block ~ ~ ~ chain_command_block[facing=down] positioned ~ ~-1 ~ if block ~ ~ ~ chain_command_block run return run function command_chain_editor:zzz/construct/loop

execute as @p[tag=command_chain_editor_use] run function command_chain_editor:zzz/show_dialog with storage command_chain_editor:temp all