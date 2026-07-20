execute store result score #world_brush_structure_block_x operator run data get entity @s Pos[0]
execute store result score #world_brush_structure_block_y operator run data get entity @s Pos[1]
execute store result score #world_brush_structure_block_z operator run data get entity @s Pos[2]

function world_brush:zzz/selection/sort_corners

execute store result score #world_brush_selected_corner_x1 operator run data get storage world_brush:temp all.selected_corner.x1
execute store result score #world_brush_selected_corner_y1 operator run data get storage world_brush:temp all.selected_corner.y1
execute store result score #world_brush_selected_corner_z1 operator run data get storage world_brush:temp all.selected_corner.z1

execute store result score #world_brush_selected_corner_x2 operator run data get storage world_brush:temp all.selected_corner.x2
execute store result score #world_brush_selected_corner_y2 operator run data get storage world_brush:temp all.selected_corner.y2
execute store result score #world_brush_selected_corner_z2 operator run data get storage world_brush:temp all.selected_corner.z2

scoreboard players add #world_brush_selected_corner_x2 operator 1
scoreboard players add #world_brush_selected_corner_y2 operator 1
scoreboard players add #world_brush_selected_corner_z2 operator 1

execute store result storage world_brush:temp all.operation.save_structure.size_x int 1 run scoreboard players operation #world_brush_selected_corner_x2 operator -= #world_brush_selected_corner_x1 operator
execute store result storage world_brush:temp all.operation.save_structure.size_y int 1 run scoreboard players operation #world_brush_selected_corner_y2 operator -= #world_brush_selected_corner_y1 operator
execute store result storage world_brush:temp all.operation.save_structure.size_z int 1 run scoreboard players operation #world_brush_selected_corner_z2 operator -= #world_brush_selected_corner_z1 operator

execute store result storage world_brush:temp all.operation.save_structure.pos_x int 1 run scoreboard players operation #world_brush_selected_corner_x1 operator -= #world_brush_structure_block_x operator
execute store result storage world_brush:temp all.operation.save_structure.pos_y int 1 run scoreboard players operation #world_brush_selected_corner_y1 operator -= #world_brush_structure_block_y operator
execute store result storage world_brush:temp all.operation.save_structure.pos_z int 1 run scoreboard players operation #world_brush_selected_corner_z1 operator -= #world_brush_structure_block_z operator

function world_brush:zzz/brush/operation/save_structure/place with storage world_brush:temp all.operation.save_structure