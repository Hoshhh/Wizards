if (string_length(keyboard_string) < 10 and writeable) {
	name = keyboard_string;
	cursor = "|";
} else {
	keyboard_string = name;	
	cursor = "";
	writeable = false;
	
	if(keyboard_check_direct(vk_backspace)){
	  var name_length = string_length(name);
   
	  string_delete(name, name_length, 1);
	  writeable = true;
	 }
}

global.name = name;