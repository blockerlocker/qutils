execute if predicate {condition:"minecraft:entity_properties",entity:"this",predicate:{"minecraft:type_specific/player":{input:{sprint:1b}}}} run return run dialog show @s world_brush:main

execute unless data entity @s SelectedItem.components."minecraft:custom_data".world_brush.operation run return run function world_brush:zzz/brush/no_left_click_function

execute unless data entity @s SelectedItem.components."minecraft:custom_data".world_brush.operation.no_left_click run return run function world_brush:zzz/brush/operation/commit_operation with entity @s SelectedItem.components."minecraft:custom_data".world_brush.operation

function world_brush:zzz/brush/no_left_click_function