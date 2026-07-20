execute store result storage speedometer:state sidebar_visible int 1 if data storage speedometer:state {sidebar_visible:0}

execute if data storage speedometer:state {sidebar_visible:1} run scoreboard objectives setdisplay sidebar speedometer
execute if data storage speedometer:state {sidebar_visible:0} run scoreboard objectives setdisplay sidebar