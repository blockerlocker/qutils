$data modify storage data_grab:temp all.copy set from $(from)
function data_grab:func/copy_to_clipboard with storage data_grab:temp all
data remove storage data_grab:temp all