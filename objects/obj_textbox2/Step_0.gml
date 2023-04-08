var confirm = keyboard_check_pressed(confirm_key);

//Type out the text
text_progress = min(text_progress + text_speed, text_length);

//Are we finished typing
if (text_progress == text_length) {
	if (confirm) {
		next();
	}
} else if (confirm) {
	text_progress = text_length;	
}