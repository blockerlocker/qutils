execute unless items entity @s weapon.mainhand item_frame[custom_data~{world_brush:{operation:{right_click_activated:true}}}] if data storage world_brush:temp all.corners[1] run function world_brush:zzz/player/box_display/init

# Set brush to alt function
execute if predicate {type:entity_properties,entity:this,predicate:{"minecraft:type_specific/player":{input:{sprint:true}}}} unless items entity @s weapon.mainhand *[custom_data~{world_brush:{alt_held:true}}] run item modify entity @s weapon.mainhand {type:set_custom_data,tag:{world_brush:{alt_held:true}}}
execute if predicate {type:entity_properties,entity:this,predicate:{"minecraft:type_specific/player":{input:{sprint:false}}}} if items entity @s weapon.mainhand *[custom_data~{world_brush:{alt_held:true}}] run item modify entity @s weapon.mainhand {type:set_custom_data,tag:{world_brush:{alt_held:false}}}

# Set brush's selection mode
execute unless score @s world_brush_selection_mode matches 1.. unless items entity @s weapon.mainhand *[custom_data~{world_brush:{selection_mode:box}}] run item modify entity @s weapon.mainhand {type:set_custom_data,tag:{world_brush:{selection_mode:box}}}
execute if score @s world_brush_selection_mode matches 1 unless items entity @s weapon.mainhand *[custom_data~{world_brush:{selection_mode:include}}] run item modify entity @s weapon.mainhand {type:set_custom_data,tag:{world_brush:{selection_mode:include}}}