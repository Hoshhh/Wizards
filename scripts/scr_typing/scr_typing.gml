function startDialogue(topic) {
	if (instance_exists(obj_textbox2)) {
		return;
	}
	
	var inst = instance_create_depth(x,y, -999, obj_textbox2);
	inst.setTopic(topic);
}



function type(x, y, text, progress, width) {
	var draw_x = 0;
	var draw_y = 0;
	
	for (var i = 1; i <= progress; i++) {
		var char = string_char_at(text, i);
		
		//Handle normal line breaks
		if (char == "\n") {
			draw_x = 0;
			draw_y += string_height("A")*0.25;
		} 
		//if we are starting a new word, we can line break
		else if (char == " ") {
			draw_x += string_width(char)*0.25;
			
			var word_width = 0;
			for (var ii = i + 1; ii <= string_length(text); ii++) {
				var word_char = string_char_at(text, ii);
				
				//If we reached the end of the word, stop checking
				if (word_char == "\n" || word_char == " ")
					break;
					
				//if the current word extends past the boundary,
				//then move it to the next line
				word_width += string_width(word_char);
				if (draw_x + word_width > width) {
					draw_x = 0;
					draw_y += string_height("A")*0.25;
					break;
				}
			}
		} else {
			//Draw the letter
			draw_text_transformed(x + draw_x, y + draw_y, char, 0.25, 0.25, 0);
			draw_x += string_width(char)*0.255;
		}
	}
}