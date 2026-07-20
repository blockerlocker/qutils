scoreboard objectives add speedometer dummy

scoreboard objectives modify speedometer displayname Speedometer

execute unless data storage speedometer:state speed_type run data modify storage speedometer:state speed_type set value horizontal