#
# This .mcfunction will summon a Text Display with a single sprite,scaled and translated to be at block-pixel scale.
# To accomplish this, the sprite's dimensions are multiplied by 0.3125, then the resulting scale of the x axis is
# multiplied by -0.025, and the scale of y axis is multiplied by -0.15.
#
#    Inputs:
#        width - sprite width in pixels
#        height - sprite height in pixels
#        scale - a scale multiplier that changes the size of sprite pixels relative to the size of block pixels
#        atlas - the atlas the sprite is from
#        sprite - the sprite path

# Summon Sprite Display
data modify storage sprite_display:temp all.transformation set value {scale:[1,1,1],translation:[0,0,0]}
$summon text_display ~ ~ ~ {text:{atlas:"$(atlas)",sprite:"$(sprite)"},background:0,data:{sprite_size:[$(height),$(width)]},Tags:[sprite_display]}


# Initial width and height scalings
data modify storage sprite_display:temp all.multiply set value [0,0,0,1,0,1,0,0,0,0,1,0,0,0,0,1]
$data modify entity @n[type=text_display,tag=sprite_display] transformation set value [0,0,0,1,0,1,0,0,0,0,1,0,0,0,0,$(width)]
data modify storage sprite_display:temp all.multiply[-1] set from entity @n[type=text_display,tag=sprite_display] transformation.translation[0]
data modify storage sprite_display:temp all.multiply[3] set value 0.3125
data modify entity @n[type=text_display,tag=sprite_display] transformation set from storage sprite_display:temp all.multiply
data modify storage sprite_display:temp all.width set from entity @n[type=text_display,tag=sprite_display] transformation.translation[0]

data modify storage sprite_display:temp all.multiply set value [0,0,0,1,0,1,0,0,0,0,1,0,0,0,0,1]
$data modify entity @n[type=text_display,tag=sprite_display] transformation set value [0,0,0,1,0,1,0,0,0,0,1,0,0,0,0,$(height)]
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