if (sprite_index == spr_axe_chop) {
	if (floor(image_index) == 4) {
		instance_create_layer(x-12,y+4, "Instances", obj_axe_hitbox);	
		//swing = true;
	}
}

/*
if (swing) {
	instance_create_layer(x-12,y+4, "Instances", obj_axe_hitbox);	
	swing = false;
}