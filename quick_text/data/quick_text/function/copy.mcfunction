data modify storage quick_text:clipboard clipboard set from entity @n[type=text_display] {}
data remove storage quick_text:clipboard clipboard.UUID
data remove storage quick_text:clipboard clipboard.Pos

tellraw @s {text:"Copied data of nearest Text Display. Summon a new Text Display and run the paste function to paste.",color:green}