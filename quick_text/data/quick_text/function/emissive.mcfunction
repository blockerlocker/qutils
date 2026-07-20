execute as @n[type=text_display] unless data entity @s brightness run data modify entity @s brightness set value {sky:0,block:0}

execute as @n[type=text_display] store result entity @s brightness.sky byte 15 store result entity @s brightness.block byte 15 unless data entity @s {brightness:{sky:15,block:15}}