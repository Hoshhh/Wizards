// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MushroomChase(){
	
	if(instance_exists(obj_player)) {
	    if(obj_player.x < x) {
			image_xscale = 1;
		} else {
			image_xscale = -1;	
		}
	}
	
	if (distance_to_object(obj_player) <= attack_dis) {
		path_end();
		state= ENEMYSTATE.ATTACK
	}
	//Should we calculate the path
	if (calc_path_timer-- <= 0) {
		//Reset timer
		calc_path_timer = calc_path_delay;
		
		var _foundPlayer = mp_grid_path(global.mp_grid, path, x, y, obj_player.x, obj_player.y, true)
	
		//Start path if we can reach player
		if (_foundPlayer) {
			path_start(path, 0.75, path_action_stop, false);
			sprite_index = spr_mushroom_run;
		}
	}
}