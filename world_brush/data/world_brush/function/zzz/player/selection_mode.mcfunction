scoreboard players add @s world_brush_selection_mode 1
scoreboard players set @s[scores={world_brush_selection_mode=2..}] world_brush_selection_mode 0

tellraw @s[scores={world_brush_selection_mode=0}] {text:"Changed Selection Mode to Box.",color:green}
tellraw @s[scores={world_brush_selection_mode=1}] {text:"Changed Selection Mode to Include.",color:green}
playsound block.vault.reject_rewarded_player ui @s ~ ~ ~ 1 2

item replace entity @s weapon.mainhand from entity @s weapon.offhand
item replace entity @s weapon.offhand with air