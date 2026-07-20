data modify storage world_brush:temp all.test_arg set value {stored_coordinates:1}

$data modify storage world_brush:temp all.operation set value {x1:$(x1),y1:$(y1),z1:$(z1),x2:$(x2),y2:$(y2),z2:$(z2)}

$execute unless data storage world_brush:temp all.test_arg{stored_coordinates:$(stored_coordinates)} run data modify storage world_brush:temp all.operation.x1 set from storage world_brush:temp all.corners[0][0]
$execute unless data storage world_brush:temp all.test_arg{stored_coordinates:$(stored_coordinates)} run data modify storage world_brush:temp all.operation.y1 set from storage world_brush:temp all.corners[0][1]
$execute unless data storage world_brush:temp all.test_arg{stored_coordinates:$(stored_coordinates)} run data modify storage world_brush:temp all.operation.z1 set from storage world_brush:temp all.corners[0][2]
$execute unless data storage world_brush:temp all.test_arg{stored_coordinates:$(stored_coordinates)} run data modify storage world_brush:temp all.operation.x2 set from storage world_brush:temp all.corners[1][0]
$execute unless data storage world_brush:temp all.test_arg{stored_coordinates:$(stored_coordinates)} run data modify storage world_brush:temp all.operation.y2 set from storage world_brush:temp all.corners[1][1]
$execute unless data storage world_brush:temp all.test_arg{stored_coordinates:$(stored_coordinates)} run data modify storage world_brush:temp all.operation.z2 set from storage world_brush:temp all.corners[1][2]

$data modify storage world_brush:temp all.operation merge value $(args)
$data modify storage world_brush:temp all.operation.args set value $(args)
$data modify storage world_brush:temp all.operation.operation set value "$(operation)"

$function world_brush:zzz/brush/operation/$(operation) with storage world_brush:temp all.operation


data remove storage world_brush:temp all.operation
data remove storage world_brush:temp all.test_arg

kill @s[tag=world_brush]