// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function BatChase(){
	sprite_index = spr_move;
	
	if (instance_exists(obj_player)) {
		xTo = obj_player.x;
		yTo = obj_player.y;
		
		var _distanceToGo = point_distance(x,y,xTo,yTo);
		direct = point_direction(x,y,xTo,yTo);
		
		if (_distanceToGo > enemySpeed) {
			hSpeed = lengthdir_x(enemySpeed, direct);	
			vSpeed = lengthdir_y(enemySpeed, direct);	
		} else {
			hSpeed = lengthdir_x(_distanceToGo, direct);	
			vSpeed = lengthdir_y(_distanceToGo, direct);
		}
	}
}