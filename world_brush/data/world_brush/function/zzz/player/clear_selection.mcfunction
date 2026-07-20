data remove storage world_brush:temp all.corners

tellraw @s {text:"Cleared selection.",color:gold}
playsound block.vault.reject_rewarded_player ui @s ~ ~ ~ 1 2

item replace entity @s weapon.mainhand from entity @s weapon.offhand
item replace entity @s weapon.offhand with air