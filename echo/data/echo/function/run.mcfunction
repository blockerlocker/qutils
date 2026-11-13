$execute unless data storage echo:run all.command run data modify storage echo:run all.count set value $(count)
$execute unless data storage echo:run all.command run data modify storage echo:run all.command set value "$(command)"

$$(command)

data modify storage echo:run all.count set compute default integer {type:sub,left:{type:storage,storage:"echo:run",path:"all.count"},right:1}

execute unless data storage echo:run all{count:0} run return run function echo:run with storage echo:run all

data remove storage echo:run all