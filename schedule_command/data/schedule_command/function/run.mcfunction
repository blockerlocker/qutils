$data modify storage schedule_command:run command set value "$(command)"
$schedule function zzz:schedule_command/scheduled $(time)