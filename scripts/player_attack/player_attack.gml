// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_attack(){
	coolDown--;
	spr = spr_attack;
	
	var _enemy = instance_nearest(x,y, obj_bat);
	if (instance_exists(_enemy)) {
		if (_enemy.x > x) {
			flip = -1;
		} else { flip = 1; }
	}
	
	
	if (x_frame == 2) {
		instance_create_layer(x,y-4, "Instances", obj_attack);
	}
			
	if (x_frame >= 5) {	
		casting = false;
		state = states.free;
	}
}