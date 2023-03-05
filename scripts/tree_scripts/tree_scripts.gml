// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tree_free(){
	sprite_index = spr_tree;
	
	var tree_inst = instance_position(mouse_x, mouse_y, id);

	if (position_meeting(mouse_x, mouse_y, tree_inst) and obj_player.image_index <= 1 and obj_player.state == states.spell) {
		instance = tree_inst;
		selected = true;	
	} 

	if (position_meeting(mouse_x, mouse_y, tree_inst)) {
		show_selected = true;	
	} else {
		show_selected = false;	
	}
	
	if ((obj_player.x_frame >= 5) and (selected == true) and obj_player.farmSpellsRemaining > 0 and (!place_meeting(x,y, obj_axe))) {
		 instance_create_layer(self.x+8, self.y-16, "Instances", obj_axe)
		 obj_player.farmSpellsRemaining -= 1;
	}
	
	if (place_meeting(x,y, obj_axe_hitbox)) {
		state = treestates.hit;	
		hp--;
		image_index = 0;
	}
	
	
	if (hp <= 0) {
		state = treestates.destroy;	
	}
}

function tree_hit(){
	sprite_index = spr_tree_hit;
	
	if (floor(image_index) >= 29) {
		state = treestates.free;	
	}
	
	if (hp <= 0) {
		state = treestates.destroy;	
	}
}

function tree_destroy(){
	var _hitbox = instance_nearest(x,y, obj_axe_hitbox)
	instance_destroy(_hitbox);

	instance_destroy();
}