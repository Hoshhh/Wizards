if (room == rm_creator) exit;
if (!debug) exit;

var xx = 0;
var cs = 16;

draw_set_alpha(0.3)

var r = roomWidth div cs;
repeat(r) {
	draw_line_color(xx-1, 0, xx-1, roomHeight, c_white, c_white);	
	xx += cs
}

var yy = 0;

var r = roomHeight div cs;
repeat(r) {
	draw_line_color(0, yy-1, roomWidth, yy-1, c_white, c_white);	
	yy += cs
}

draw_set_alpha(1)

var c = c_yellow
if (instance_exists(obj_player)) {
	draw_rectangle_color(obj_player.bbox_left, obj_player.bbox_top, obj_player.bbox_right, obj_player.bbox_bottom, c, c, c, c, true)
}