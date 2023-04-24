// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MushroomWonder(){
	counter += 1;
	//x += moveX;
	//y += moveY;
	mp_potential_step_object(x + moveX, y + moveY, enemySpeed, all);
	//move_and_collide(moveX, moveY, all)
	
	//Transition Triggers
	if (counter >= room_speed * 2) {
		var change = choose(0,1);
		switch(change) {
			case 0: state = ENEMYSTATE.IDLE;
			case 1:
				direct = point_direction(x,y, xstart, ystart) + irandom_range(-45, 45);
				xTo = x + lengthdir_x(enemyWanderDistance, direct);
				yTo = y + lengthdir_y(enemyWanderDistance, direct);
				
				var _distanceToGo = point_distance(x,y,xTo,yTo);
				var _speedThisFrame = enemySpeed;
		
				if (_distanceToGo < enemySpeed) _speedThisFrame = _distanceToGo;
				direct = point_direction(x,y, xTo, yTo);
				
				//my_dir = irandom_range(0,359);
				moveX = lengthdir_x(_speedThisFrame, direct);
				moveY = lengthdir_y(_speedThisFrame, direct);
				counter = 0;
				
				if (instance_position(x + moveX, y + moveY, all) != noone) {
					state = ENEMYSTATE.IDLE;
				}
		}
	}
	
	sprite_index = spr_mushroom_run;
	image_xscale = sign(-moveX);
}