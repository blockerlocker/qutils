execute as @n[type=text_display] unless data entity @s {billboard:center} run return run data modify entity @s billboard set value center
data remove entity @n[type=text_display] billboard