execute as @n[type=text_display] unless data entity @s text.text run data modify storage quick_text:temp all.text.text set from entity @s text
execute as @n[type=text_display] unless data entity @s text.text run data modify storage quick_text:temp all.text.color set value "white"
execute as @n[type=text_display] unless data entity @s text.text run data modify entity @s text set from storage quick_text:temp all.text
data remove storage quick_text:temp all

$data modify entity @n[type=text_display] text.color set value "$(color)"
