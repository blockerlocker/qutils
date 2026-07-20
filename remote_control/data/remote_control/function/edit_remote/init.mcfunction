execute unless data entity @s SelectedItem.components."minecraft:custom_data".item_data run return run tellraw @s {text:"Remote Edit Failed: No remote detected in Main Hand.",color:red}

data modify storage remote_control:temp edit set from entity @s SelectedItem.components."minecraft:custom_data".item_data

data merge storage remote_control:temp {edit:{right_click_mode_impulse_init:false,right_click_mode_constant_init:false}}

data modify storage remote_control:temp reconstruct.list set from storage remote_control:temp edit.right_click
function remote_control:edit_remote/reconstruct/init
data modify storage remote_control:temp edit.right_click set from storage remote_control:temp reconstruct.out
data remove storage remote_control:temp reconstruct

data modify storage remote_control:temp reconstruct.list set from storage remote_control:temp edit.left_click
function remote_control:edit_remote/reconstruct/init
data modify storage remote_control:temp edit.left_click set from storage remote_control:temp reconstruct.out
data remove storage remote_control:temp reconstruct

execute if data storage remote_control:temp edit{right_click_mode:"impulse"} run data modify storage remote_control:temp edit.right_click_mode_impulse_init set value true
execute if data storage remote_control:temp edit{right_click_mode:"constant"} run data modify storage remote_control:temp edit.right_click_mode_constant_init set value true

function remote_control:edit_remote/dialog with storage remote_control:temp edit

data remove storage remote_control:temp edit