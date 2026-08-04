execute as @n[type=text_display] unless data entity @s {billboard:horizontal} run return run data modify entity @s billboard set value horizontal
data remove entity @n[type=text_display] billboard