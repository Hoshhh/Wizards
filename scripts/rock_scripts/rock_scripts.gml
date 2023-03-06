// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function rock_free(){
	sprite_index = spr_rock;
	
	var rock_inst = instance_position(mouse_x, mouse_y, id);

	if (position_meeting(mouse_x, mouse_y, rock_inst) and obj_player.image_index <= 1 and obj_player.state == states.spell and obj_player.farmSpellsRemaining > 0) {
		instance = rock_inst;
		selected = true;	
	} 

	if (position_meeting(mouse_x, mouse_y, rock_inst)) {
		show_selected = true;	
	} else {
		show_selected = false;	
	}
	
	if ((obj_player.x_frame >= 5) and (selected == true) and obj_player.farmSpellsRemaining > 0 and (!place_meeting(x,y, obj_pick))) {
		 instance_create_layer(self.x+7, self.y-8, "Instances", obj_pick)
		 obj_player.farmSpellsRemaining -= 1;
	}
	
	if (place_meeting(x,y, obj_axe_hitbox)) {
		state = rockstates.hit;	
		hp--;
		image_index = 0;
	}
	
	
	if (hp <= 0) {
		state = rockstates.destroy;	
	}
}

function rock_hit(){
	sprite_index = spr_rock_hit;
	
	if (floor(image_index) >= 29) {
		state = rockstates.free;	
	}
	
	if (hp <= 0) {
		state = rockstates.destroy;	
	}
}

function rock_destroy(){
	var _hitbox = instance_nearest(x,y, obj_axe_hitbox)
	instance_destroy(_hitbox);

	instance_destroy();
}