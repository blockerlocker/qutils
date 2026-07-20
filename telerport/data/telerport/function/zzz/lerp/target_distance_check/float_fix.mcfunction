data remove storage telerport:temp all.whole_float_fix
$data modify storage telerport:temp all.whole_float_fix.float set value "$(target_x).0"
function telerport:zzz/lerp/target_distance_check/float_test with storage telerport:temp all.whole_float_fix
execute if data storage telerport:temp all.whole_float_fix.out run data modify storage telerport:temp all.target_x set from storage telerport:temp all.whole_float_fix.float

data remove storage telerport:temp all.whole_float_fix
$data modify storage telerport:temp all.whole_float_fix.float set value "$(target_y).0"
function telerport:zzz/lerp/target_distance_check/float_test with storage telerport:temp all.whole_float_fix
execute if data storage telerport:temp all.whole_float_fix.out run data modify storage telerport:temp all.target_y set from storage telerport:temp all.whole_float_fix.float

data remove storage telerport:temp all.whole_float_fix
$data modify storage telerport:temp all.whole_float_fix.float set value "$(target_z).0"
function telerport:zzz/lerp/target_distance_check/float_test with storage telerport:temp all.whole_float_fix
execute if data storage telerport:temp all.whole_float_fix.out run data modify storage telerport:temp all.target_z set from storage telerport:temp all.whole_float_fix.float

function telerport:zzz/lerp/target_distance_check/commit with storage telerport:temp all