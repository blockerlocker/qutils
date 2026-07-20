execute if data storage speedometer:state {speed_type:absolute} run function zzz:speedometer/absolute/init
execute if data storage speedometer:state {speed_type:horizontal} run function zzz:speedometer/horizontal/init

execute unless data storage speedometer:state {sidebar_visible:1} run return fail


execute store result storage speedometer:temp all.speed float 0.1 run scoreboard players get @s speedometer
execute if score @s speedometer matches 0..99 run data modify storage speedometer:temp all.speed set string storage speedometer:temp all.speed 0 3
execute if score @s speedometer matches 100..999 run data modify storage speedometer:temp all.speed set string storage speedometer:temp all.speed 0 4

tag @s add speedometer_getname
summon text_display ~ ~ ~ {text:{selector:"@n[tag=speedometer_getname]"},Tags:[speedometer_text_display]}
data modify storage speedometer:temp all.name set from entity @n[type=text_display,tag=speedometer_text_display] text.hover_event.name
kill @e[type=text_display,tag=speedometer_text_display]
tag @s remove speedometer_getname

function zzz:speedometer/display/set_score with storage speedometer:temp all

data remove storage speedometer:temp all
