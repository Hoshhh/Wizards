// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tree_free(){
	sprite_index = spr_tree;
	
	if (place_meeting(x,y, obj_axe_hitbox)) {
		state = treestates.hit;	
		hp--;
		image_index = 0;
	}
}

function tree_hit(){
	sprite_index = spr_tree_hit;
	
	if (floor(image_index) >= 29) {
		state = treestates.free;	
	}
}

function tree_destroy(){
	
	
}