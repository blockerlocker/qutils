advancement revoke @s only remote_control:right_click


execute unless entity @s[scores={remote_control_impulse_cooldown=1..}] run function remote_control:use_remote/right_click/run

execute if items entity @s weapon.mainhand *[custom_data~{item_data:{right_click_mode:"impulse"}}] run scoreboard players set @s remote_control_impulse_cooldown 2