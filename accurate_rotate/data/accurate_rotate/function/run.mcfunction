$rotate @s $(args)
execute as @s store success entity @s OnGround byte 1 store success entity @s data.OnGroundToggle byte 1 unless data entity @s data{OnGroundToggle:1b}