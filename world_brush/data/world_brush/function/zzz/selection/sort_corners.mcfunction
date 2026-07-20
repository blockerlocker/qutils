execute store result score #world_brush_selected_corner_x1 operator run data get storage world_brush:temp all.corners[0][0]
execute store result score #world_brush_selected_corner_y1 operator run data get storage world_brush:temp all.corners[0][1]
execute store result score #world_brush_selected_corner_z1 operator run data get storage world_brush:temp all.corners[0][2]
execute store result score #world_brush_selected_corner_x2 operator run data get storage world_brush:temp all.corners[1][0]
execute store result score #world_brush_selected_corner_y2 operator run data get storage world_brush:temp all.corners[1][1]
execute store result score #world_brush_selected_corner_z2 operator run data get storage world_brush:temp all.corners[1][2]


scoreboard players operation #world_brush_selected_corner_greater_x operator = #world_brush_selected_corner_x1 operator
scoreboard players operation #world_brush_selected_corner_lesser_x operator = #world_brush_selected_corner_x2 operator
execute if score #world_brush_selected_corner_x2 operator > #world_brush_selected_corner_x1 operator run scoreboard players operation #world_brush_selected_corner_greater_x operator = #world_brush_selected_corner_x2 operator
execute if score #world_brush_selected_corner_x2 operator > #world_brush_selected_corner_x1 operator run scoreboard players operation #world_brush_selected_corner_lesser_x operator = #world_brush_selected_corner_x1 operator

scoreboard players operation #world_brush_selected_corner_greater_y operator = #world_brush_selected_corner_y1 operator
scoreboard players operation #world_brush_selected_corner_lesser_y operator = #world_brush_selected_corner_y2 operator
execute if score #world_brush_selected_corner_y2 operator > #world_brush_selected_corner_y1 operator run scoreboard players operation #world_brush_selected_corner_greater_y operator = #world_brush_selected_corner_y2 operator
execute if score #world_brush_selected_corner_y2 operator > #world_brush_selected_corner_y1 operator run scoreboard players operation #world_brush_selected_corner_lesser_y operator = #world_brush_selected_corner_y1 operator

scoreboard players operation #world_brush_selected_corner_greater_z operator = #world_brush_selected_corner_z1 operator
scoreboard players operation #world_brush_selected_corner_lesser_z operator = #world_brush_selected_corner_z2 operator
execute if score #world_brush_selected_corner_z2 operator > #world_brush_selected_corner_z1 operator run scoreboard players operation #world_brush_selected_corner_greater_z operator = #world_brush_selected_corner_z2 operator
execute if score #world_brush_selected_corner_z2 operator > #world_brush_selected_corner_z1 operator run scoreboard players operation #world_brush_selected_corner_lesser_z operator = #world_brush_selected_corner_z1 operator

execute store result storage world_brush:temp all.selected_corner.x1 int 1 run scoreboard players get #world_brush_selected_corner_lesser_x operator
execute store result storage world_brush:temp all.selected_corner.y1 int 1 run scoreboard players get #world_brush_selected_corner_lesser_y operator
execute store result storage world_brush:temp all.selected_corner.z1 int 1 run scoreboard players get #world_brush_selected_corner_lesser_z operator

execute store result storage world_brush:temp all.selected_corner.x2 int 1 run scoreboard players get #world_brush_selected_corner_greater_x operator
execute store result storage world_brush:temp all.selected_corner.y2 int 1 run scoreboard players get #world_brush_selected_corner_greater_y operator
execute store result storage world_brush:temp all.selected_corner.z2 int 1 run scoreboard players get #world_brush_selected_corner_greater_z operator