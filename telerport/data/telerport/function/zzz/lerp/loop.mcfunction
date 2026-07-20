execute store result score @s telerport.current.x run data get entity @s Pos[0] 10000
execute store result score @s telerport.current.y run data get entity @s Pos[1] 10000
execute store result score @s telerport.current.z run data get entity @s Pos[2] 10000

scoreboard players operation #telerport.new.x operator = @s telerport.target.x
scoreboard players operation #telerport.new.x operator -= @s telerport.current.x
scoreboard players operation #telerport.new.x operator *= @s telerport.speed
scoreboard players operation #telerport.new.x operator /= #10k operator
scoreboard players operation #telerport.new.x operator += @s telerport.current.x

scoreboard players operation #telerport.new.y operator = @s telerport.target.y
scoreboard players operation #telerport.new.y operator -= @s telerport.current.y
scoreboard players operation #telerport.new.y operator *= @s telerport.speed
scoreboard players operation #telerport.new.y operator /= #10k operator
scoreboard players operation #telerport.new.y operator += @s telerport.current.y

scoreboard players operation #telerport.new.z operator = @s telerport.target.z
scoreboard players operation #telerport.new.z operator -= @s telerport.current.z
scoreboard players operation #telerport.new.z operator *= @s telerport.speed
scoreboard players operation #telerport.new.z operator /= #10k operator
scoreboard players operation #telerport.new.z operator += @s telerport.current.z

execute store result storage telerport:temp all.new_x double 0.0001 run scoreboard players get #telerport.new.x operator
execute store result storage telerport:temp all.new_y double 0.0001 run scoreboard players get #telerport.new.y operator
execute store result storage telerport:temp all.new_z double 0.0001 run scoreboard players get #telerport.new.z operator

function telerport:zzz/lerp/teleport_new with storage telerport:temp all

data remove storage telerport:temp all

execute if function telerport:zzz/lerp/target_distance_check/init run function telerport:lerp_cancel

tag @s[tag=telerport_at_target] remove telerport_at_target