For Minecraft 26.3

Various utility data packs I use, nothing super crazy, just a bunch of small useful things. Below are quicky summaries of each tool.

| Pack | Description |
| --- | --- |
| accurate_rotate | Just the `/rotate` command with OnGround toggling for accurate Display Entity rotation. ([more info in MC Commands Discord](https://discord.com/channels/154777837382008833/157097006500806656/1402253905408163842))<br>`/function accurate_rotate:run {args:"<x_rotation> <y_rotation>"}` |
| command_chain_editor | Adds an item that lets you edit an entire chain of Command Blocks. Obtain with:<br>`/loot give @s loot command_chain_editor:command_chain_editor` |
| command_viz | Adds an item that lets you spawn Text Displays above a chain of Command Blocks that display the command inside. Breaking the block removes the display. Obtain with:<br>`/loot give @s loot command_viz:command_visualizer` |
| data_grab | Easily copy any NBT data to the clipboard. Can be from a block, entity, or data storage. Example:<br>`/function data_grab:copy_from {from:"storage speedometer:state sidebar_visible"}` |
| echo | Run a command as many times as you want. Example:<br>`/function echo:run {command:"say hi",count:5}` |
| last_death | Teleport to last death location.<br>`/function last_death:tp` |
| quick_text | Various functions for quickly modifying the nearest Text Display. Functions without arguments are toggles.<br>`/function quick_text:copy`<br>`/function quick_text:paste`<br>`/function quick_text:billboard_center`<br>`/function quick_text:emissive`<br>`/function quick_text:shadow`<br>`/function quick_text:nudge_facing {amount:<blocks>}`<br>`/function quick_text:set_background {color:<color>}`<br>`/function quick_text:set_line_width {width:<amount>}`<br>`/function quick_text:set_scale {scale:<amount>}`<br>`/function quick_text:set_text {text:<text>}`<br> |
| remote_control | Quickly create and edit basic items that run commands when left or right clicked. Available in Quick Dialog menu, or manually with<br>`/dialog show @s remote_control:new_remote` |
| schedule_command | Run a command after a set amount of time. Only one command can be scheduled at a time. Example:<br>`/function schedule_command:run {command:"say hi",time:"4s"}` |
| sprite_display | Easily spawn and rescale Text Displays with a single sprite in them. All created entities have the tag `sprite_display` to more easily target them. Rescale function works on nearest Sprite Display and multiplies the current scale. Examples:<br>`/function sprite_display:summon {atlas:blocks,sprite:"block/nether_portal",width:16,height:16,scale:1}`<br>`/function sprite_display:rescale {scale:2}` |
| telerport | Lerping teleport functions, mainly meant for Display Entities. Examples:<br>`/execute as @n[type=item_display] at @s run function telerport:lerp_relative {x:0,y:5,z:0,speed:0.05}`<br>`/execute as @n[type=item_display] run function telerport:lerp_cancel` |
| ticky | Quickly run arbitrary commands every tick without Command Blocks.<br>`/function ticky:add`<br>`/function ticky:remove`<br>`/function ticky:clear` |
| world_brush | Basic world editing tools. Right click a Brush on any block while in creative mode to obtain the World Brush, and then Sprint+Left Click to open the menu and select a tool. Use Right Click to select regions, and Left Click to run the tool. Press the Offhand button while holding a World Brush to change selection mode, and Sprint+Offhand to clear your selection. Some tools activate on Right Click instead of Left Click, like Clone, Run Command, and Place Structure Block. |
| world_notes | A simple universal notepad for the world.<br>`/function world_notes:open` |
