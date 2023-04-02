//Draw textbox
//draw_sprite(box, 0, box_x, box_y);
draw_sprite_part_ext(box, 0, 0, 0, box_width, box_height, box_x, box_y, scale, scale, c_white, 1);

//Draw Portrait Back
//draw_sprite(frame, 0, port_x, port_y);
draw_sprite_part_ext(frame, 0, 0, 0, port_width, port_height, port_x, port_y, scale, scale, c_white, 1);

//Draw Portrait
//draw_sprite(portrait, port_index, port_x, port_y);
draw_sprite_part_ext(portrait, port_index, 0, 0, port_width, port_height, port_x, port_y, scale, scale, c_white, 1);

//Draw Portrait Frame
//draw_sprite(frame, 1, port_x, port_y);
draw_sprite_part_ext(frame, 1, 0, 0, port_width, port_height, port_x, port_y, scale, scale, c_white, 1);

//Draw Namebox
//draw_sprite(namebox, 0, namebox_x, namebox_y);
draw_sprite_part_ext(namebox, 1, 0, 0, namebox_width, namebox_height, namebox_x, namebox_y, scale, scale, c_white, 1);


//------Text
draw_set_font(font);

//Draw Name
var c = name_text_col;
draw_set_halign(fa_center); //draw_set_valign(fa_middle);
draw_text_transformed_color(name_text_x, name_text_y, npc_name, 0.115*scale, 0.115*scale, 0, c,c,c,c, 1); 
draw_set_halign(fa_left); //draw_set_valign(fa_top);

if (!choice_dialogue) {
	//Draw Text
	if (!pause and counter < str_len){
		counter++;
		//Play text sound every 4 frames
		if (counter mod 4 == 0) {
			audio_play_sound(voice, 10, false);
		}
	
		switch (string_char_at(text_wrapped, counter)) {
			case ",": pause = true; alarm[1] = 15; break;
			case ".": 
			case "?": 
			case "!": pause = true; alarm[1] = 25; break;
		}
	}
	var substr = string_copy(text_wrapped, 1, counter);

	c = text_col;
	draw_text_transformed_color(text_x, text_y, substr, 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
} else {
	c = text_col
	var i = 0, y_add = 0; repeat(text_array_len)
	{
		if (choice == i) { c = choice_col; draw_text_transformed_color(box_x+text_max_width, text_y+y_add, "<", 0.115*scale, 0.115*scale, 0, c,c,c,c, 1); } 
			else c = text_col;
			draw_text_ext_transformed_color(text_x, text_y + y_add, text_array[i], text_height, text_max_width+1100, 0.115*scale, 0.115*scale, 0, c,c,c,c, 1);
			y_add += string_height_ext(text_array[i], text_height, text_max_width)
			i++;
			
	}
}