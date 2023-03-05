// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function cutscene_move_character(_obj, _x, _y, _relative, _spd){
	if (x_dest == -1) {
		if (!_relative)	{
			x_dest = _x;
			y_dest = _y;
		} else {
			x_dest = _obj.x + _x;
			y_dest = _obj.y + _y;
		}
	}
	
	
	var xx = x_dest;
	var yy = y_dest;
	
	with(_obj) {
		spr = spr_run;
		if (point_distance(x, y, xx, yy) >= _spd) {
			var dir = point_direction(x, y, xx, yy);
			var ldirx = lengthdir_x(_spd, dir);
			var ldiry = lengthdir_y(_spd, dir);
			
			if (ldirx != 0) { flip = -sign(ldirx); }
				
			x += ldirx;
			y += ldiry;
						
		} else {
			spr = spr_idle;
			
			x = xx;
			y = yy;
			moving = false;
			
			with(other) {
				x_dest = -1;
				y_dest = -1;
				cutscene_end_action();	
			}
		}
	}
}