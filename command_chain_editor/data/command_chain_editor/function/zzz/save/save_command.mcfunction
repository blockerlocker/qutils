execute unless data storage command_chain_editor:temp all{command:''} unless data storage command_chain_editor:temp all{command:'\n'} run data modify storage command_chain_editor:temp all.save_commands append from storage command_chain_editor:temp all.command
data modify storage command_chain_editor:temp all.command set value ''

execute unless data storage command_chain_editor:temp all{command_list:''} run function command_chain_editor:zzz/save/split_loop with storage command_chain_editor:temp all