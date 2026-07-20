execute store result storage telerport:temp all.target_x double 0.0001 run scoreboard players get @s telerport.target.x
execute store result storage telerport:temp all.target_y double 0.0001 run scoreboard players get @s telerport.target.y
execute store result storage telerport:temp all.target_z double 0.0001 run scoreboard players get @s telerport.target.z

function telerport:zzz/lerp/target_distance_check/float_fix with storage telerport:temp all

data modify storage telerport:temp example set from storage telerport:temp all

data remove storage telerport:temp all

execute if entity @s[tag=telerport_at_target] run return 1