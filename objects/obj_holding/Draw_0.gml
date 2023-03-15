draw_sprite_part(item_spr, 0, x_frame*cell_size, y_frame*cell_size, cell_size, cell_size, x - x_offset, y - y_offset);


if (obj != noone) {
	var xx1 = 0;
	var cs = 16;
	draw_set_alpha(0.5)

	var r = room_width div cs;
	repeat(r) {
		draw_line_color(xx1-1, 0, xx1-1, room_height, color, color);	
		xx1 += cs
	}

	var yy1 = 0;

	var r = room_height div cs;
	repeat(r) {
		draw_line_color(0, yy1-1, room_width, yy1-1, color, color);	
		yy1 += cs
	}

	draw_set_alpha(1)



	var cs = cell_size;
	var xx = (mx div cs);
	var yy = (my div cs);
	xx = xx*cs;
	yy = yy*cs;
	
	var c = color;
	var bl = sprite_get_bbox_left(spr);
	var br = sprite_get_bbox_right(spr);
	var bt = sprite_get_bbox_top(spr);
	var bb = sprite_get_bbox_bottom(spr);
	var h = sprite_get_height(spr)
	var w = sprite_get_width(spr)

	if (snap) {
		draw_rectangle_color((xx+bl)-w/2,(yy+bt)-h+cs,(xx+br)-w/2,(yy+bb)-h+cs, c,c,c,c, true);
		draw_sprite_ext(spr, 0, xx, yy + (cs), 1,1,0,c_white, 0.7);
	} else {
		draw_rectangle_color((mx+bl)-w/2,(my+bt)-h,(mx+br)-w/2,(my+bb)-h, c,c,c,c, true);
		draw_sprite_ext(spr, 0, mx, my, 1,1,0,c_white, 0.7);
	}

}
