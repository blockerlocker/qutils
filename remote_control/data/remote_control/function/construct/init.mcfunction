$data modify storage remote_control:temp full_function set value "$(function)"

data remove storage remote_control:temp new_function

scoreboard players set #remote_control_counter operator 0

function remote_control:construct/parse_newline