execute unless data storage world_brush:temp all.corners[1] run return run function world_brush:zzz/brush/select/box

execute positioned ^ ^ ^-0.5 align xyz run summon marker ~ ~ ~ {Tags:[world_brush_corner]}
data modify storage world_brush:temp all.include_corner set from entity @n[type=marker,tag=world_brush_corner] Pos
kill @n[type=marker,tag=world_brush_corner]
kill @s

execute store result score #world_brush_include_x operator run data get storage world_brush:temp all.include_corner[0]
execute store result score #world_brush_include_y operator run data get storage world_brush:temp all.include_corner[1]
execute store result score #world_brush_include_z operator run data get storage world_brush:temp all.include_corner[2]

function world_brush:zzz/selection/sort_corners

execute if score #world_brush_include_x operator > #world_brush_selected_corner_greater_x operator run scoreboard players operation #world_brush_selected_corner_greater_x operator = #world_brush_include_x operator
execute if score #world_brush_include_y operator > #world_brush_selected_corner_greater_y operator run scoreboard players operation #world_brush_selected_corner_greater_y operator = #world_brush_include_y operator
execute if score #world_brush_include_z operator > #world_brush_selected_corner_greater_z operator run scoreboard players operation #world_brush_selected_corner_greater_z operator = #world_brush_include_z operator

execute if score #world_brush_include_x operator < #world_brush_selected_corner_lesser_x operator run scoreboard players operation #world_brush_selected_corner_lesser_x operator = #world_brush_include_x operator
execute if score #world_brush_include_y operator < #world_brush_selected_corner_lesser_y operator run scoreboard players operation #world_brush_selected_corner_lesser_y operator = #world_brush_include_y operator
execute if score #world_brush_include_z operator < #world_brush_selected_corner_lesser_z operator run scoreboard players operation #world_brush_selected_corner_lesser_z operator = #world_brush_include_z operator

execute store result storage world_brush:temp all.corners[0][0] double 1 run scoreboard players get #world_brush_selected_corner_greater_x operator
execute store result storage world_brush:temp all.corners[0][1] double 1 run scoreboard players get #world_brush_selected_corner_greater_y operator
execute store result storage world_brush:temp all.corners[0][2] double 1 run scoreboard players get #world_brush_selected_corner_greater_z operator

execute store result storage world_brush:temp all.corners[1][0] double 1 run scoreboard players get #world_brush_selected_corner_lesser_x operator
execute store result storage world_brush:temp all.corners[1][1] double 1 run scoreboard players get #world_brush_selected_corner_lesser_y operator
execute store result storage world_brush:temp all.corners[1][2] double 1 run scoreboard players get #world_brush_selected_corner_lesser_z operator