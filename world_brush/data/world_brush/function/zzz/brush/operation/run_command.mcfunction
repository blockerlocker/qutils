$execute store result storage world_brush:temp all.operation.success byte 1 run $(command)

execute unless data storage world_brush:temp all.operation{success:0b} run playsound block.shelf.multi_swap ui @a ~ ~ ~ 1 1
execute if data storage world_brush:temp all.operation{success:0b} run playsound block.note_block.bass ui @a