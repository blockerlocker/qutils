execute unless data storage remote_control:temp reconstruct.list[0] run return fail

data modify storage remote_control:temp reconstruct.out set from storage remote_control:temp reconstruct.list[0]
data remove storage remote_control:temp reconstruct.list[0]

execute if data storage remote_control:temp reconstruct.list[0] run function remote_control:edit_remote/reconstruct/loop