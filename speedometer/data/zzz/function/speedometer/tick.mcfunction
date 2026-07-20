execute as @e[tag=speedometer] at @s run function zzz:speedometer/main
scoreboard players reset @e[tag=!speedometer,scores={speedometer=0..}]