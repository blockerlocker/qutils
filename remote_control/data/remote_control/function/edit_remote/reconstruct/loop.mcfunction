data modify storage remote_control:temp reconstruct.index set from storage remote_control:temp reconstruct.list[0]

function remote_control:edit_remote/reconstruct/append with storage remote_control:temp reconstruct

data remove storage remote_control:temp reconstruct.list[0]

execute if data storage remote_control:temp reconstruct.list[0] run function remote_control:edit_remote/reconstruct/loop