execute as @n[type=!player,nbt={Brain:{}}] if entity @s[tag=speedometer] run return run tag @s remove speedometer
tag @n[type=!player,nbt={Brain:{}}] add speedometer