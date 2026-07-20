data modify storage ticky:temp all.commands set from storage ticky:commands all
function zzz:ticky/remove/loop
data modify storage ticky:temp all.tellraw append value {text:"\nClick command to remove from Ticky.",underlined:false,color:yellow}

tellraw @s {storage:"ticky:temp",nbt:"all.tellraw",interpret:true}

data remove storage ticky:temp all