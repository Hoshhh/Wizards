draw_sprite_part(item_spr, 0, x_frame*cell_size, y_frame*cell_size, cell_size, cell_size, x - x_offset, y - y_offset);

var cs = cell_size;
var xx = (mx div cs);
var yy = (my div cs);
var c = color;

xx = xx*cs;
yy = yy*cs;

/*
if (obj != noone) {
	draw_rectangle_color(xx-8,yy,xx+(cs*2)-9,yy+cs-1, c,c,c,c, true);
	draw_sprite_ext(obj.sprite_index, 0, xx + (cs/2), yy + (cs/2), 1,1,0,c_white, 0.7);
}*/


switch(item_num) {
	case item.chest :
		draw_rectangle_color(xx-8,yy,xx+(cs*2)-9,yy+cs-1, c,c,c,c, true);
		draw_sprite_ext(spr_chest02, 0, xx + (cs/2), yy + (cs/2), 1,1,0,c_white, 0.7);
	break;
	
	case item.furnace :
		draw_rectangle_color(xx-8,yy,xx+(cs*2)-9,yy+cs-1, c,c,c,c, true);
		draw_sprite_ext(spr_furnace, 0, xx + (cs/2), yy + (cs/2), 1,1,0,c_white, 0.7);
	break;
}

/*
if (item_num = item.chest) {
	var cs = cell_size;
	var xx = (mx div cs);
	var yy = (my div cs);
	var c = color;

	xx = xx*cs;
	yy = yy*cs;
	
	draw_rectangle_color(xx-8,yy,xx+(cs*2)-9,yy+cs-1, c,c,c,c, true)

	draw_sprite_ext(spr_chest02, 0, xx + (cs/2), yy + (cs/2), 1,1,0,c_white, 0.7)	
}

if (item_num = item.furnace) {
	var cs = cell_size;
	var xx = (mx div cs);
	var yy = (my div cs);
	var c = color;

	xx = xx*cs;
	yy = yy*cs;
	
	draw_rectangle_color(xx-8,yy,xx+(cs*2)-9,yy+cs-1, c,c,c,c, true)

	draw_sprite_ext(spr_furnace, 0, xx + (cs/2), yy + (cs/2), 1,1,0,c_white, 0.7)	
}