data modify storage last_death:temp all.x set from entity @s LastDeathLocation.pos[0]
data modify storage last_death:temp all.y set from entity @s LastDeathLocation.pos[1]
data modify storage last_death:temp all.z set from entity @s LastDeathLocation.pos[2]
function zzz:last_death/commit with storage last_death:temp all
data remove storage last_death:temp all