execute as @n[type=text_display] unless data entity @s {billboard:vertical} run return run data modify entity @s billboard set value vertical
data remove entity @n[type=text_display] billboard