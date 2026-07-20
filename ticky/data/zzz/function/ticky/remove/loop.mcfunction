data modify storage ticky:temp all.text_component set value {color:gold,underlined:true,click_event:{action:run_command}}
data modify storage ticky:temp all.text_component.text set from storage ticky:temp all.commands[0].command
function zzz:ticky/remove/set_click_event with storage ticky:temp all.text_component
data modify storage ticky:temp all.tellraw append from storage ticky:temp all.text_component
data modify storage ticky:temp all.tellraw append value "\n"

data remove storage ticky:temp all.commands[0]

execute if data storage ticky:temp all.commands[0] run function zzz:ticky/remove/loop