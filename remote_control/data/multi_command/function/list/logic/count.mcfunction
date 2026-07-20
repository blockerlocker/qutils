execute store result storage multi_command:temp data.count int 1 run scoreboard players add #multi_command_counter multi_command_count 1
function multi_command:list/logic/store_command with storage multi_command:temp data
data remove storage multi_command:temp data.list[0]
execute if data storage multi_command:temp data.list[0] run function multi_command:list/logic/count