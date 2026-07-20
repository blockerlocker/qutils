data modify storage ticky:temp all.command set from storage ticky:temp all.commands[0].command
function zzz:ticky/run with storage ticky:temp all
data remove storage ticky:temp all.command
data remove storage ticky:temp all.commands[0]
execute if data storage ticky:temp all.commands[0] run function zzz:ticky/loop