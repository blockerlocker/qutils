$execute if entity @s[x_rotation=-90..-45] rotated 0 -90 as @n[type=text_display] positioned as @s run return run tp @s ^ ^ ^$(amount)
$execute if entity @s[x_rotation=45..90] rotated 0 90 as @n[type=text_display] positioned as @s run return run tp @s ^ ^ ^$(amount)
$execute if entity @s[y_rotation=-45..45] rotated 0 0 as @n[type=text_display] positioned as @s run return run tp @s ^ ^ ^$(amount)
$execute if entity @s[y_rotation=45..135] rotated 90 0 as @n[type=text_display] positioned as @s run return run tp @s ^ ^ ^$(amount)
$execute if entity @s[y_rotation=135..-135] rotated 180 0 as @n[type=text_display] positioned as @s run return run tp @s ^ ^ ^$(amount)
$execute if entity @s[y_rotation=-135..-45] rotated -90 0 as @n[type=text_display] positioned as @s run return run tp @s ^ ^ ^$(amount)

