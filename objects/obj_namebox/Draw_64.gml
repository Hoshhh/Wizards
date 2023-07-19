//var c = #657697
draw_rectangle_color(x + (194 * scale), (y+(scale*44)), 
(x+(scale * 242)), (y+(scale*53)), c,c,c,c, false);
//draw_text(x,y, string(writeable))
//draw_text(x,y+16, string(keyboard_string))

//draw_text stuff
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_font(fnt_test);
draw_text_ext_transformed(x + (196 * scale),(y+(scale*45)), string(name + cursor), 100, 2000, 0.16*scale, 0.16*scale,0)

var gui_x = device_mouse_x_to_gui(0)
var gui_y = device_mouse_y_to_gui(0)
if (mouse_check_button_pressed(mb_left)) {
	if (point_in_rectangle(gui_x, gui_y, (x + (194 * scale)), (y+(scale*44)), (x + (scale * 242)), (y+(scale*53))))	{
		writeable = true;
	} else {
		writeable = false;	
	}
}
//