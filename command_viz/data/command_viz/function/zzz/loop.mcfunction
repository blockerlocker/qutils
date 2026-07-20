execute positioned ~ ~0.5 ~ unless entity @e[type=text_display,tag=command_viz,distance=..0.1] summon text_display run data merge entity @s {Tags:[command_viz],billboard:vertical,line_width:160,shadow:1b,transformation:{scale:[.25,.25,.25]}}

execute if block ~ ~ ~ #command_viz:command_root[facing=south] positioned ~ ~ ~1 if block ~ ~ ~ chain_command_block run return run function command_viz:zzz/loop
execute if block ~ ~ ~ #command_viz:command_root[facing=north] positioned ~ ~ ~-1 if block ~ ~ ~ chain_command_block run return run function command_viz:zzz/loop
execute if block ~ ~ ~ #command_viz:command_root[facing=east] positioned ~1 ~ ~ if block ~ ~ ~ chain_command_block run return run function command_viz:zzz/loop
execute if block ~ ~ ~ #command_viz:command_root[facing=west] positioned ~-1 ~ ~ if block ~ ~ ~ chain_command_block run return run function command_viz:zzz/loop
execute if block ~ ~ ~ #command_viz:command_root[facing=up] positioned ~ ~1 ~ if block ~ ~ ~ chain_command_block run return run function command_viz:zzz/loop
execute if block ~ ~ ~ #command_viz:command_root[facing=down] positioned ~ ~-1 ~ if block ~ ~ ~ chain_command_block run return run function command_viz:zzz/loop

execute if block ~ ~ ~ chain_command_block[facing=south] positioned ~ ~ ~1 if block ~ ~ ~ chain_command_block run return run function command_viz:zzz/loop
execute if block ~ ~ ~ chain_command_block[facing=north] positioned ~ ~ ~-1 if block ~ ~ ~ chain_command_block run return run function command_viz:zzz/loop
execute if block ~ ~ ~ chain_command_block[facing=east] positioned ~1 ~ ~ if block ~ ~ ~ chain_command_block run return run function command_viz:zzz/loop
execute if block ~ ~ ~ chain_command_block[facing=west] positioned ~-1 ~ ~ if block ~ ~ ~ chain_command_block run return run function command_viz:zzz/loop
execute if block ~ ~ ~ chain_command_block[facing=up] positioned ~ ~1 ~ if block ~ ~ ~ chain_command_block run return run function command_viz:zzz/loop
execute if block ~ ~ ~ chain_command_block[facing=down] positioned ~ ~-1 ~ if block ~ ~ ~ chain_command_block run return run function command_viz:zzz/loop