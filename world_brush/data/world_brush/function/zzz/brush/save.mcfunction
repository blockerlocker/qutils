data modify storage world_brush:temp all.operation.x1 set from storage world_brush:temp all.corners[0][0]
data modify storage world_brush:temp all.operation.y1 set from storage world_brush:temp all.corners[0][1]
data modify storage world_brush:temp all.operation.z1 set from storage world_brush:temp all.corners[0][2]
data modify storage world_brush:temp all.operation.x2 set from storage world_brush:temp all.corners[1][0]
data modify storage world_brush:temp all.operation.y2 set from storage world_brush:temp all.corners[1][1]
data modify storage world_brush:temp all.operation.z2 set from storage world_brush:temp all.corners[1][2]

$data modify storage world_brush:temp all.operation merge value $(args)
$data modify storage world_brush:temp all.operation.args set value $(args)
$data modify storage world_brush:temp all.operation.operation set value "$(operation)"

function world_brush:zzz/brush/set_item_data/init with storage world_brush:temp all

data remove storage world_brush:temp all.operation

tellraw @s {text:"Function saved to brush.",color:green}
playsound block.vault.reject_rewarded_player ui @s ~ ~ ~ 1 2