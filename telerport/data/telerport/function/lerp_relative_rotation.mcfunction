$data modify storage telerport:temp all.relative.speed set value $(speed)

$summon marker ^$(x) ^$(y) ^$(z) {Tags:[telerport_relative_target]}

$execute positioned ^$(x) ^$(y) ^$(z) run data modify storage telerport:temp all.relative.x set from entity @n[tag=telerport_relative_target] Pos[0]
$execute positioned ^$(x) ^$(y) ^$(z) run data modify storage telerport:temp all.relative.y set from entity @n[tag=telerport_relative_target] Pos[1]
$execute positioned ^$(x) ^$(y) ^$(z) run data modify storage telerport:temp all.relative.z set from entity @n[tag=telerport_relative_target] Pos[2]

$execute positioned ^$(x) ^$(y) ^$(z) run kill @n[tag=telerport_relative_target]

function telerport:lerp with storage telerport:temp all.relative