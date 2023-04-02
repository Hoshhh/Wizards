var c = c_yellow
draw_set_font(fnt_smalldigits);

if (!show_store) exit;

draw_text_color(10,5, "gw: " + string(global.game_width), c,c,c,c, 1);
draw_text_color(10,15, "gh: " + string(global.game_height), c,c,c,c, 1);

draw_sprite_part_ext(
	spr_ui, 0, 0, 0, store_ui_width, store_ui_height, 
	store_ui_x, store_ui_y, scale, scale, c_white, 1);
	
var sx = 0;
var sy = 0;


var item_select_xx = item_select_x;
var item_select_yy = item_select_y + (18*select*scale);

if (select >= 0) {
	draw_sprite_ext(spr_select_item,0, item_select_xx, item_select_yy, scale, scale, 0, c_white, 1);
}