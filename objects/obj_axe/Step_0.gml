if (sprite_index == spr_axe_chop) {
	if (floor(image_index) == 4) {
		instance_create_layer(x-12,y+4, "Instances", obj_axe_hitbox);	
		//swing = true;
	}
}

var _inst = instance_position(x,y, par_tree);
if (_inst == noone and ceil(image_index) >= 6) {
	sprite_index = spr_axe_despawn;
}


/*
if (swing) {
	instance_create_layer(x-12,y+4, "Instances", obj_axe_hitbox);	
	swing = false;
}