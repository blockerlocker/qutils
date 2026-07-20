$execute unless data storage command_chain_editor:temp all{current_char:'\n'} run data modify storage command_chain_editor:temp all.command set value '$(command)$(current_char)'

data modify storage command_chain_editor:temp all.command_list set string storage command_chain_editor:temp all.command_list 1
data modify storage command_chain_editor:temp all.current_char set string storage command_chain_editor:temp all.command_list 0 1
execute if data storage command_chain_editor:temp all{command_list:''} run data modify storage command_chain_editor:temp all.current_char set value ''

execute if data storage command_chain_editor:temp all{command_list:''} run return run function command_chain_editor:zzz/save/save_command
execute if data storage command_chain_editor:temp all{current_char:'\n'} run return run function command_chain_editor:zzz/save/save_command

execute unless data storage command_chain_editor:temp all{command_list:''} run function command_chain_editor:zzz/save/split_loop with storage command_chain_editor:temp all