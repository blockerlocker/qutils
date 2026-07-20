item modify entity @s weapon.mainhand {type:"minecraft:set_custom_data",tag:{world_brush:{operation:null}}}
$item modify entity @s weapon.mainhand {type:"minecraft:set_custom_data",tag:{world_brush:{operation:$(operation)}}}

execute if data storage world_brush:temp all.operation{operation:select} run return run item modify entity @s weapon.mainhand {type:"minecraft:set_components",components:{"!minecraft:custom_name":{}}}
execute if data storage world_brush:temp all.operation{operation:fill} run return run function world_brush:zzz/brush/set_item_data/fill with storage world_brush:temp all.operation
execute if data storage world_brush:temp all.operation{operation:replace} run return run function world_brush:zzz/brush/set_item_data/replace with storage world_brush:temp all.operation
execute if data storage world_brush:temp all.operation{operation:clone} run return run function world_brush:zzz/brush/set_item_data/clone with storage world_brush:temp all.operation
execute if data storage world_brush:temp all.operation{operation:run_command} run return run function world_brush:zzz/brush/set_item_data/run_command with storage world_brush:temp all.operation
execute if data storage world_brush:temp all.operation{operation:save_structure} run return run item modify entity @s weapon.mainhand {type:"minecraft:set_components",components:{"minecraft:custom_name":"Place Structure Block"}}
