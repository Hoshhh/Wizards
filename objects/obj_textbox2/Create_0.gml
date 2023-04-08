//Can Edit
//Input
confirm_key = vk_space;

//Position
margin = 16;
padding = 8;
width = display_get_gui_width() - margin*8;
height = sprite_height;

x = (display_get_gui_width() - width) / 2;
y = display_get_gui_height() - height - margin;

//Text
text_font = fnt_dialogue;
text_color = c_white;
text_speed = 0.6;
text_x = padding;
text_y = padding;
text_width = width - padding*2;


//Do not edit
actions = [];
current_action = -1;

text = "";
text_progress = 0;
text_length = 0;


//Methods

//Start a conversation
setTopic = function(topic) {
	actions = global.topics[$ topic];
	current_action = -1;
	
	next();
}

//Move to the next action, or close the textbox if out of actions
next = function() {
	current_action++;
	if (current_action >= array_length(actions)) {
		instance_destroy();	
	} else {
		actions[current_action].act(id);	
	}
}

//Set the text that should be typed out
setText = function(newText) {
	text = newText;
	text_length = string_length(newText);
	text_progress = 0;
}