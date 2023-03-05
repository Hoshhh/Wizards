if (keyboard_check_pressed(interact_key))
{
	if (!choice_dialogue and counter < str_len){
		counter = str_len;
	} else if (page < array_length(text) - 1) {
		event_perform(ev_other, ev_user2);
		
		var line = next_line[page];
		if (choice_dialogue) line = line[choice];
		
		if (line == 0) page++;
		else if (line == -1) { instance_destroy(); exit; }
		else page = line;

		event_perform(ev_other, ev_user1);
	} else {
		instance_destroy();	
	}
}

if (choice_dialogue) {
	choice += keyboard_check_pressed(ord("S")) - keyboard_check_pressed(ord("W"))
	
	if (choice > text_array_len-1) choice = 0;
	if (choice < 0) choice = text_array_len-1;
}
//test = scripts[page]
/*
var _yes = scripts[page];
if (is_array(_yes)) {
	test = _yes[1]
}