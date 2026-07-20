scoreboard objectives add multi_command_count dummy
scoreboard players set #multi_command_counter multi_command_count 0
$data modify storage multi_command:temp data.list set value $(commands)

execute if data storage multi_command:temp data.list[0] run function multi_command:list/logic/count

function multi_command:list/logic/commit with storage multi_command:temp data

data remove storage multi_command:temp data
scoreboard objectives remove multi_command_count