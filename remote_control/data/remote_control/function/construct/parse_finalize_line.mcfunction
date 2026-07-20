data modify storage remote_control:temp new_function append from storage remote_control:temp current_line

execute unless data storage remote_control:temp {full_function:""} run function remote_control:construct/parse_newline