//Draw Notifications
var not_grid = ds_notifications;
var grid_height = ds_grid_height(not_grid);
var c = c_white;
draw_set_font(font);

var yy = 0; repeat(grid_height) {
	var not_sign = "";
	if (not_grid[# 0, yy] > 0) { not_sign = "+"; }
	
	if (drop) {
		var _string = draw_text_color(
			100,
			(gui_height/2)+(yy*(str_height+16))-(grid_height*str_height), 
			not_sign+string(not_grid[# 0, yy]),
			c,c,c,c, not_alpha
		);
		var _width = string_width(_string)
		draw_sprite_part_ext(item_spr, 0, not_grid[# 2, yy]*cell_size, not_grid[# 3, yy]*cell_size, cell_size, cell_size, _width + 16, (gui_height/2)+(yy*(str_height+16))-(grid_height*str_height + 16), scale, scale, c_white, not_alpha);
	} else if (sell) {
		draw_text_color(
			100,
			(gui_height/2)+(yy*(str_height+16))-(grid_height*str_height), 
			string(not_grid[# 0, yy]) + " " + string(not_grid[# 1, yy] + " sold"),
			c,c,c,c, not_alpha
		);	
	}
	
	yy++;
}

//Fade Away
if (fade_away) not_alpha -= 0.1;
if (not_alpha <= 0) instance_destroy();