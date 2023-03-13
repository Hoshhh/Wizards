draw_sprite_part(item_spr, 0, x_frame*cell_size, y_frame*cell_size, cell_size, cell_size, x - x_offset, y - y_offset);





var cs = cell_size;
var xx = (mx div cs);
var yy = (my div cs);
var c = color;
var bl = sprite_get_bbox_left(spr);
var br = sprite_get_bbox_right(spr);
var bt = sprite_get_bbox_top(spr);
var bb = sprite_get_bbox_bottom(spr);
var h = sprite_get_height(spr)
var w = sprite_get_width(spr)

draw_rectangle_color((mx+bl)-w/2,(my+bt)-h,(mx+br)-w/2,(my+bb)-h, c,c,c,c, true);
draw_sprite_ext(spr, 0, mx, my , 1,1,0,c_white, 0.7);

/*
draw_rectangle_color(mx-(br/2),my-(bb/2),mx+(br/2)-1,my, c,c,c,c, true);
draw_sprite_ext(spr, 0, mx, my , 1,1,0,c_white, 0.7);
/*
switch(item_num) {
	case item.chest :
		draw_rectangle_color(mx-bl,my,mx+(br-1),my+bb-1, c,c,c,c, true);
		draw_sprite_ext(spr, 0, mx, my + (cs/2), 1,1,0,c_white, 0.7);
	break;
}

/*
if (obj != noone) {
	draw_rectangle_color(xx-8,yy,xx+(cs*2)-9,yy+cs-1, c,c,c,c, true);
	draw_sprite_ext(obj.sprite_index, 0, xx + (cs/2), yy + (cs/2), 1,1,0,c_white, 0.7);
}*/

/*
switch(item_num) {
	case item.chest :
		draw_rectangle_color(xx-cs,yy,xx+(cs-1),yy+cs-1, c,c,c,c, true);
		draw_sprite_ext(spr_chest02, 0, xx, yy + (cs/2), 1,1,0,c_white, 0.7);
	break;
	
	case item.furnace :
		draw_rectangle_color(xx-cs,yy,xx+(cs-1),yy+cs-1, c,c,c,c, true);
		draw_sprite_ext(spr_furnace, 0, xx, yy + (cs/2), 1,1,0,c_white, 0.7);
	break;
	
	case item.smallshelf :
		draw_rectangle_color(xx-cs,yy,xx+(cs-1),yy+cs-1, c,c,c,c, true);
		draw_sprite_ext(spr_shelf_small, 0, xx, yy + (cs/2), 1,1,0,c_white, 0.7);
	break;
	
	case item.largeshelf :
		draw_rectangle_color(xx-cs,yy-cs,xx+(cs*2)-1,yy-1, c,c,c,c, true);
		draw_sprite_ext(spr_shelf_large, 0, xx + (cs/2), yy, 1,1,0,c_white, 0.7);
	break;
	
	case item.smallhortable :
		draw_rectangle_color(xx-cs,yy,xx+(cs-1),yy+cs-1, c,c,c,c, true);
		draw_sprite_ext(spr_horizontal_small, 0, xx, yy + (cs/2), 1,1,0,c_white, 0.7);
	break;
	
	case item.largehortable :
		draw_rectangle_color(xx-cs,yy,xx+(cs*2)-1,yy+cs-1, c,c,c,c, true);
		draw_sprite_ext(spr_horizontal_large, 0, xx + (cs/2), yy + (cs/2), 1,1,0,c_white, 0.7);
	break;
	
	case item.smallverttable :
		draw_rectangle_color(xx,yy-(cs*2)+8,xx+(cs-1),yy+8, c,c,c,c, true);
		draw_sprite_ext(spr_verticle_small, 0, xx + (cs/2), yy + (cs/2), 1,1,0,c_white, 0.7);
	break;
	
	case item.largeverttable :
		draw_rectangle_color(xx,yy-(cs*3)+8,xx+(cs-1),yy+8, c,c,c,c, true);
		draw_sprite_ext(spr_verticle_large, 0, xx + (cs/2), yy + (cs/2), 1,1,0,c_white, 0.7);
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