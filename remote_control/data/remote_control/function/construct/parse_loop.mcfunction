execute if data storage remote_control:temp {full_function:""} run return run data modify storage remote_control:temp new_function append from storage remote_control:temp current_line

data remove storage remote_control:temp next_char

data modify storage remote_control:temp current_char set string storage remote_control:temp full_function 0 1
data modify storage remote_control:temp full_function set string storage remote_control:temp full_function 1

execute unless data storage remote_control:temp {current_char:"\n"} run return run function remote_control:construct/parse_append_character with storage remote_control:temp

function remote_control:construct/parse_finalize_line with storage remote_control:temp