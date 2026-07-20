execute positioned ~ ~ ~-1 if block ~ ~ ~ chain_command_block[facing=south] run return run function command_chain_editor:zzz/find_origin
execute positioned ~ ~ ~1 if block ~ ~ ~ chain_command_block[facing=north] run return run function command_chain_editor:zzz/find_origin
execute positioned ~-1 ~ ~ if block ~ ~ ~ chain_command_block[facing=east] run return run function command_chain_editor:zzz/find_origin
execute positioned ~1 ~ ~ if block ~ ~ ~ chain_command_block[facing=west] run return run function command_chain_editor:zzz/find_origin
execute positioned ~ ~-1 ~ if block ~ ~ ~ chain_command_block[facing=up] run return run function command_chain_editor:zzz/find_origin
execute positioned ~ ~1 ~ if block ~ ~ ~ chain_command_block[facing=down] run return run function command_chain_editor:zzz/find_origin

execute positioned ~ ~ ~-1 if block ~ ~ ~ #command_chain_editor:command_root[facing=south] run return run function command_chain_editor:zzz/construct/init
execute positioned ~ ~ ~1 if block ~ ~ ~ #command_chain_editor:command_root[facing=north] run return run function command_chain_editor:zzz/construct/init
execute positioned ~-1 ~ ~ if block ~ ~ ~ #command_chain_editor:command_root[facing=east] run return run function command_chain_editor:zzz/construct/init
execute positioned ~1 ~ ~ if block ~ ~ ~ #command_chain_editor:command_root[facing=west] run return run function command_chain_editor:zzz/construct/init
execute positioned ~ ~-1 ~ if block ~ ~ ~ #command_chain_editor:command_root[facing=up] run return run function command_chain_editor:zzz/construct/init
execute positioned ~ ~1 ~ if block ~ ~ ~ #command_chain_editor:command_root[facing=down] run return run function command_chain_editor:zzz/construct/init

kill @s
playsound block.note_block.bass ui @a