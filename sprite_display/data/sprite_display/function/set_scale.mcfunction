# Reset scale and translation
data modify storage sprite_display:temp all.transformation set value {translation:[0,0,0],scale:[1,1,1]}


# Initial width and height scalings
data modify storage sprite_display:temp all.multiply set value [0,0,0,1,0,1,0,0,0,0,1,0,0,0,0,1]
data modify storage sprite_display:temp all.width set value [0,0,0,1,0,1,0,0,0,0,1,0,0,0,0,1]
data modify storage sprite_display:temp all.width[15] set from entity @n[type=text_display,tag=sprite_display] data.sprite_size[0]
data modify entity @n[type=text_display,tag=sprite_display] transformation set from storage sprite_display:temp all.width
data modify storage sprite_display:temp all.multiply[-1] set from entity @n[type=text_display,tag=sprite_display] transformation.translation[0]
data modify storage sprite_display:temp all.multiply[3] set value 0.3125
data modify entity @n[type=text_display,tag=sprite_display] transformation set from storage sprite_display:temp all.multiply
data modify storage sprite_display:temp all.width set from entity @n[type=text_display,tag=sprite_display] transformation.translation[0]

data modify storage sprite_display:temp all.multiply set value [0,0,0,1,0,1,0,0,0,0,1,0,0,0,0,1]
data modify storage sprite_display:temp all.height set value [0,0,0,1,0,1,0,0,0,0,1,0,0,0,0,1]
data modify storage sprite_display:temp all.height[15] set from entity @n[type=text_display,tag=sprite_display] data.sprite_size[1]
data modify entity @n[type=text_display,tag=sprite_display] transformation set from storage sprite_display:temp all.height
data modify storage sprite_display:temp all.multiply[-1] set from entity @n[type=text_display,tag=sprite_display] transformation.translation[0]
data modify storage sprite_display:temp all.multiply[3] set value 0.3125
data modify entity @n[type=text_display,tag=sprite_display] transformation set from storage sprite_display:temp all.multiply
data modify storage sprite_display:temp all.height set from entity @n[type=text_display,tag=sprite_display] transformation.translation[0]


# Multiplied by input scale
data modify storage sprite_display:temp all.multiply set value [0,0,0,1,0,1,0,0,0,0,1,0,0,0,0,1]
$data modify entity @n[type=text_display,tag=sprite_display] transformation set value [0,0,0,1,0,1,0,0,0,0,1,0,0,0,0,$(scale)]
data modify storage sprite_display:temp all.multiply[-1] set from entity @n[type=text_display,tag=sprite_display] transformation.translation[0]
data modify storage sprite_display:temp all.multiply[3] set from storage sprite_display:temp all.width
data modify entity @n[type=text_display,tag=sprite_display] transformation set from storage sprite_display:temp all.multiply
data modify storage sprite_display:temp all.transformation.scale[0] set from entity @n[type=text_display,tag=sprite_display] transformation.translation[0]

data modify storage sprite_display:temp all.multiply set value [0,0,0,1,0,1,0,0,0,0,1,0,0,0,0,1]
$data modify entity @n[type=text_display,tag=sprite_display] transformation set value [0,0,0,1,0,1,0,0,0,0,1,0,0,0,0,$(scale)]
data modify storage sprite_display:temp all.multiply[-1] set from entity @n[type=text_display,tag=sprite_display] transformation.translation[0]
data modify storage sprite_display:temp all.multiply[3] set from storage sprite_display:temp all.height
data modify entity @n[type=text_display,tag=sprite_display] transformation set from storage sprite_display:temp all.multiply
data modify storage sprite_display:temp all.transformation.scale[1] set from entity @n[type=text_display,tag=sprite_display] transformation.translation[0]


# Set Translations
data modify storage sprite_display:temp all.multiply set value [0,0,0,1,0,1,0,0,0,0,1,0,0,0,0,1]
data modify storage sprite_display:temp all.multiply[-1] set from storage sprite_display:temp all.transformation.scale[0]
data modify entity @n[type=text_display,tag=sprite_display] transformation set from storage sprite_display:temp all.multiply
data modify storage sprite_display:temp all.multiply[-1] set from entity @n[type=text_display,tag=sprite_display] transformation.translation[0]
data modify storage sprite_display:temp all.multiply[3] set value -0.025
data modify entity @n[type=text_display,tag=sprite_display] transformation set from storage sprite_display:temp all.multiply
data modify storage sprite_display:temp all.transformation.translation[0] set from entity @n[type=text_display,tag=sprite_display] transformation.translation[0]

data modify storage sprite_display:temp all.multiply set value [0,0,0,1,0,1,0,0,0,0,1,0,0,0,0,1]
data modify storage sprite_display:temp all.multiply[-1] set from storage sprite_display:temp all.transformation.scale[1]
data modify entity @n[type=text_display,tag=sprite_display] transformation set from storage sprite_display:temp all.multiply
data modify storage sprite_display:temp all.multiply[-1] set from entity @n[type=text_display,tag=sprite_display] transformation.translation[0]
data modify storage sprite_display:temp all.multiply[3] set value -0.15
data modify entity @n[type=text_display,tag=sprite_display] transformation set from storage sprite_display:temp all.multiply
data modify storage sprite_display:temp all.transformation.translation[1] set from entity @n[type=text_display,tag=sprite_display] transformation.translation[0]


# Finalize
data modify entity @n[type=text_display] transformation merge from storage sprite_display:temp all.transformation
data remove storage sprite_display:temp all