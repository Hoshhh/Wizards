// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MushroomIdle(){
	counter += 1;
	
	//Transition Triggers
	if (counter >= room_speed * 3) {
		var change = choose(0,1);
		switch(change) {
			case 0: state = ENEMYSTATE.WANDER;
			case 1: counter = 0; break;
		}
	}
	
	/*
	if (collision_circle(x, y + 8, enemyAggroRadius, obj_player, false, false)) {
		state = ENEMYSTATE.ALERT;
	}*/
	
	//Sprite
	sprite_index = spr_mushroom_idle;
}