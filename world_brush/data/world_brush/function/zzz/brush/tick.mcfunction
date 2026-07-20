execute if data entity @s data.world_brush{alt_held:true} run return run function world_brush:zzz/brush/alt_function/main

execute if data entity @s data.world_brush.operation.right_click_activated run return run function world_brush:zzz/brush/operation/commit_operation with entity @s data.world_brush.operation

execute if data entity @s data.world_brush{selection_mode:box} run return run function world_brush:zzz/brush/select/box

execute if data entity @s data.world_brush{selection_mode:include} run return run function world_brush:zzz/brush/select/include

tellraw @a {text:"World Brush failed to do anything for some reason, whoops!",color:red}
kill @s