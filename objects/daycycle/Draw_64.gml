if (room = rm_creator) exit;

/*
if (draw_daylight) {
	var c = light_color
	draw_set_alpha(darkness);
	draw_rectangle_color(0,0, guiWidth, guiHeight, c,c,c,c, false)
	draw_set_alpha(1);
}

*/

var c = c_yellow
//draw_text_color(10,10, string(crops.daysOld), c,c,c,c, 1);
draw_set_font(fnt_test)
//draw_text_color(10,30, string(test), c,c,c,c, 1);
/*
if (notification > 0) {
	draw_text_color(10, 90, "Plants can be watered again!", c,c,c,c, 1);	
}*/
draw_text_color(10,10, "Minutes: " + string(minutes), c,c,c,c, 1);
draw_text_color(10,50, "Hour: " + string(hours), c,c,c,c, 1);
draw_text_color(10,90, "Day: " + string(day), c,c,c,c, 1);
draw_text_color(10,130, "Season: " + string(season), c,c,c,c, 1);
draw_text_color(10,170, "Year: " + string(year), c,c,c,c, 1);
//draw_text_color(10,210, "test: " + string(test), c,c,c,c, 1);