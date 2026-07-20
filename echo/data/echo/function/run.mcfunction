execute unless data storage echo:run all.command run scoreboard objectives add echo_count dummy
execute unless data storage echo:run all.command run scoreboard players set @s echo_count 0
$execute unless data storage echo:run all.command run data modify storage echo:run all.count set value $(count)

$data modify storage echo:run all.command set value "$(command)"
$execute if score @s echo_count matches ..$(count) unless data storage echo:run all{count:0} run $(command)
scoreboard players add @s echo_count 1
$execute if score @s echo_count matches $(count).. run data modify storage echo:run all.complete set value true

execute unless data storage echo:run all.complete run return run function echo:run with storage echo:run all

data remove storage echo:run all
scoreboard objectives remove echo_count