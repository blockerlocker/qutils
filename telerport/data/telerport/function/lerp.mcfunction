function telerport:lerp_cancel

$data modify storage telerport:temp all.target_x set value $(x)
$data modify storage telerport:temp all.target_y set value $(y)
$data modify storage telerport:temp all.target_z set value $(z)
$data modify storage telerport:temp all.speed set value $(speed)

execute store result score @s telerport.target.x run data get storage telerport:temp all.target_x 10000
execute store result score @s telerport.target.y run data get storage telerport:temp all.target_y 10000
execute store result score @s telerport.target.z run data get storage telerport:temp all.target_z 10000

execute store result score @s telerport.speed run data get storage telerport:temp all.speed 10000

data remove storage telerport:temp all

tag @s add telerporting