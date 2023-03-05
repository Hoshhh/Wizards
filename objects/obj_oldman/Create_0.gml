event_inherited();

//Curent system is to set the DID_CHANGE varaible to 1 in whatever you want an NPC to have new dialog
//and change it into 1 which will turn the npc into a whole new NPC of the same type with new text
//oldman1 -> oldman2 -> etc when you chance did_change from 0->1 in the step event

port_index = 1;
voice = snd_voice4;
npc_name = "Old Man";
did_change = 0;

text = [
	"Hello, who might you be sonny?", 
	[
		"I'm Player, I'm kinda a big deal. I'm also going to be adding more text to the screen so I can test things.", 
		"I am a servant of the enternal flame, sir."
	], 
	"Sure you are kid.",
	"What does that even mean?"
];

speakers = [id, obj_player, id, id];
next_line = [0, [2, 3], -1, -1]; //-1 ends dialogue
scripts = [
	[change_variable, display_manager, "target", obj_player],
		[
			[wrapper, id, "did_change", 0, display_manager, "target", id],
			[change_variable, display_manager, "target", id],
		],
	[change_variable, id, "did_change", 1],
	[change_variable, id, "did_change", 1]
]

