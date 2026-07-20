$dialog show @s {\
	type: "minecraft:multi_action",\
	title: "World Notes",\
	inputs: [\
		{\
			type: "minecraft:text",\
			key: "notes",\
			width: 300,\
			label: "Notes",\
            initial: "$(notes)",\
			max_length: 10000000,\
			multiline: {\
				max_lines: 2048,\
				height: 150\
			}\
		}\
	],\
	actions: [\
		{\
			label: "Close without Saving"\
		},\
		{\
			label: "Save and Close",\
			action: {\
				type: "minecraft:dynamic/run_command",\
				template: "data modify storage world_notes:save notes set value \"\u0024(notes)\""\
			}\
		}\
	]\
}