execute positioned ^ ^ ^-0.5 align xyz run summon marker ~ ~ ~ {Tags:[world_brush_corner]}
data modify storage world_brush:temp all.corners append from entity @n[type=marker,tag=world_brush_corner] Pos
kill @n[type=marker,tag=world_brush_corner]
kill @s

execute unless data storage world_brush:temp all.corners[1] run data modify storage world_brush:temp all.corners append from storage world_brush:temp all.corners[0]
execute if data storage world_brush:temp all.corners[2] run data remove storage world_brush:temp all.corners[0]