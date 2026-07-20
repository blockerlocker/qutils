data remove storage remote_control:temp item_data
$data merge storage remote_control:temp {item_data:{right_click_mode:$(right_click_mode)}}

$data modify storage remote_control:temp function set value "$(left_click)"
function remote_control:construct/init with storage remote_control:temp
data modify storage remote_control:temp item_data.left_click set from storage remote_control:temp new_function

$data modify storage remote_control:temp function set value "$(right_click)"
function remote_control:construct/init with storage remote_control:temp
data modify storage remote_control:temp item_data.right_click set from storage remote_control:temp new_function

function remote_control:give_remote/commit with storage remote_control:temp