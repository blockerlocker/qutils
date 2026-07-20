function world_brush:zzz/selection/sort_corners

scoreboard players add #world_brush_selected_corner_greater_x operator 1
scoreboard players add #world_brush_selected_corner_greater_y operator 1
scoreboard players add #world_brush_selected_corner_greater_z operator 1

execute store result storage world_brush:temp all.selected_corner.x2 int 1 run scoreboard players get #world_brush_selected_corner_greater_x operator
execute store result storage world_brush:temp all.selected_corner.y2 int 1 run scoreboard players get #world_brush_selected_corner_greater_y operator
execute store result storage world_brush:temp all.selected_corner.z2 int 1 run scoreboard players get #world_brush_selected_corner_greater_z operator

function world_brush:zzz/player/box_display/particle with storage world_brush:temp all.selected_corner

data remove storage world_brush:temp all.selected_corner