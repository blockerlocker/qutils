scoreboard players remove @s remote_control_impulse_cooldown 1
execute if score @s remote_control_impulse_cooldown matches 1.. run return fail
scoreboard players reset @s remote_control_impulse_cooldown