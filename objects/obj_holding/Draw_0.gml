draw_sprite_part(item_spr, 0, x_frame*cell_size, y_frame*cell_size, cell_size, cell_size, x - x_offset, y - y_offset);

if (item_num = item.chest) {
	var cs = cell_size;
	var xx = (mx div cs);
	var yy = (my div cs);
	var c = color;

	xx = xx*cs;
	yy = yy*cs;
	
	draw_rectangle_color(xx,yy,xx+cs-1,yy+cs-1, c,c,c,c, true)

	draw_sprite_ext(spr_chest02, 0, xx + (cs/2), yy + (cs/2), 1,1,0,c_white, 0.7)	
}