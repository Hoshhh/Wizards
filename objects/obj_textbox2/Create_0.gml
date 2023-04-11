//Can Edit
//Input
confirm_key = vk_space;
up_key = ord("W");
down_key = ord("S");
max_input_delay = 5;
input_delay = max_input_delay;

//Position
margin = 8;
padding = 8;
width = display_get_gui_width() - margin*16;
height = sprite_height;

x = (display_get_gui_width() - width) / 2;
y = display_get_gui_height() - height - margin+6;

//Text
text_font = fnt_dialogue;
text_color = c_white;
text_speed = 0.6;
text_x = padding;
text_y = padding;
text_width = width - padding*2;

//Portrait
portrait_x = padding;
portrait_y = padding*1.5;

//Speaker
speaker_x = padding;
speaker_y = 0;
speaker_font = fnt_dialogue;
speaker_color = c_white;

//Option 
option_x = padding;
option_y = padding * 2;
option_spacing = 12;
option_selection_indent = 12;
option_width = sprite_get_width(spr_name_bg);
option_height = sprite_get_height(spr_name_bg);
option_text_x = 45;
option_text_color = c_yellow;

//Do not edit
actions = [];
current_action = -1;

text = "";
text_progress = 0;
text_length = 0;

portrait_sprite = -1;
portrait_width = sprite_get_width(spr_portrait);
portrait_height = sprite_get_height(spr_portrait);
portrait_side = PORTRAIT_SIDE.LEFT;

enum PORTRAIT_SIDE {
	LEFT,
	RIGHT
}

speaker_name = ""
speaker_width = sprite_get_width(spr_name_bg);
speaker_height = sprite_get_height(spr_name_bg);

options = [];
current_option = 0;
option_count = 0;

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