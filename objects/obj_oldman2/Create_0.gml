event_inherited();

port_index = 1;
voice = snd_voice4;
npc_name = "Old Man";
did_change = 0;
text = [
	"Have you seen my dragon?", 
	[
		"I have not seen you're dragon, sir.", 
		"uhhhhhhhh..."
	], 
	"Sadge.",
	"*ahem*"
];

speakers = [id, obj_player, id, id];
next_line = [0, [2, 3], -1, -1]; //-1 ends dialogue
scripts = [
	[change_variable, display_manager, "target", obj_player],
		[
			[wrapper, id, "did_change", 1, display_manager, "target", id],
			[change_variable, display_manager, "target", id],
		],
	-1,
	-1
]

