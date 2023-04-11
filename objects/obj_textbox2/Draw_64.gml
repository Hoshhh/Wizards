draw_sprite_stretched(sprite_index, 0, x, y, width, height);

var draw_text_x = x;
var draw_text_y = y;
var draw_text_width = text_width;

var finished = text_progress == text_length;

//Portrait
if (sprite_exists(portrait_sprite)) {
	//Shrink text width by the width of the portrait
	draw_text_width -= portrait_width + portrait_x + padding;
	
	var draw_portrait_x = x + portrait_x;
	var draw_portrait_y = y + portrait_y;
	var draw_portrait_xscale = 1;
	
	if (portrait_side == PORTRAIT_SIDE.LEFT) {
		//Shift the text over to the right
		draw_text_x += portrait_width + portrait_x + padding;
	} else {
		draw_portrait_x = x + width - portrait_width - padding;	
		draw_portrait_xscale = -1;
	}
	
	//Draw portrait bg
	draw_sprite(spr_portrait, 0, draw_portrait_x, draw_portrait_y);
	
	draw_sprite_ext(portrait_sprite, 0,
		draw_portrait_x + portrait_width / 2, draw_portrait_y + portrait_height / 2,
		draw_portrait_xscale, 1, 0, c_white, 1);
}

//Speaker
if (speaker_name != "") {
	//expand the nameplate if the name is wider than the default width
	var name_w = max(string_width(speaker_name), speaker_width) * 0.25;
	
	draw_sprite_stretched(spr_name_bg, 0, x + speaker_x, y + speaker_y - speaker_height / 2, name_w, speaker_height);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(speaker_font);
	draw_set_color(speaker_color);
	draw_text_transformed(x + speaker_x + name_w / 2, y + speaker_y, speaker_name, 0.25, 0.25, 0);
}

//Text
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(text_font);
draw_set_color(text_color);
type(draw_text_x + text_x, draw_text_y + text_y, text, text_progress, draw_text_width);

// Options
if (finished && option_count > 0) {
	draw_set_valign(fa_middle);
	draw_set_color(option_text_color);
	for (var i = 0; i < option_count; i++) {
		var option_w = max(string_width(options[i].text), option_width) * 0.25;
		var opt_x = x + option_x;
		var opt_y = y + option_y - (option_count - i - 1) * option_spacing;
		
		// Selected option is indented with an arrow
		if (i == current_option) {
			opt_x += option_selection_indent;
			draw_sprite(spr_indicator, 0, opt_x + option_text_x-8, opt_y + (text_y*2 + 4));
		}
		
		//type(opt_x + option_text_x, opt_y + (text_y*2 + 4), options[i].text, text_progress, draw_text_width+500);
		//draw_sprite_stretched(spr_name_bg, 0, opt_x + option_text_x - 4, opt_y + (text_y*2 + 4) - option_height / 2, option_w+8, option_height);
		draw_text_transformed(opt_x + option_text_x, opt_y + (text_y*2 + 4), options[i].text, 0.25, 0.25, 0);
	}
}