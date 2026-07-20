data modify storage remote_control:temp current_char set value "0"
data modify storage remote_control:temp current_line set value ""

execute store result storage remote_control:temp current_count int 1 run scoreboard players add #remote_control_counter operator 1

function remote_control:construct/parse_loop