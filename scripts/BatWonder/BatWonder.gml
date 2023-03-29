// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function BatWonder(){
	sprite_index = spr_move;
	
	//At destination or given up
	if ((x == xTo) && (y == yTo)) || (time_passed > enemyWanderDistance/enemySpeed){
		hSpeed = 0;
		vSpeed = 0;
		
		//Set new destination
		if (++wait >= waitDuration) {
			wait = 0;
			time_passed = 0;
			direct = point_direction(x,y, xstart, ystart) + irandom_range(-45, 45);
			xTo = x + lengthdir_x(enemyWanderDistance, direct);
			yTo = y + lengthdir_y(enemyWanderDistance, direct);
		}
	} else {
		//Move towards new destination
		time_passed++;
		var _distanceToGo = point_distance(x,y,xTo,yTo);
		var _speedThisFrame = enemySpeed;
		
		if (_distanceToGo < enemySpeed) _speedThisFrame = _distanceToGo;
		direct = point_direction(x,y, xTo, yTo);
		hSpeed = lengthdir_x(_speedThisFrame, direct);
		vSpeed = lengthdir_y(_speedThisFrame, direct);
	}
	
	//Check for aggro
	if (++aggroCheck >= aggroCheckDuration) {
		aggroCheck = 0;
		if (instance_exists(obj_player)) && (point_distance(x,y, obj_player.x, obj_player.y) <= enemyAggroRadius) {
			state = ENEMYSTATE.CHASE;
			//target = obj_player;
		}
	}
	
	
}