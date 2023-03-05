var crop_inst = instance_position(mouse_x, mouse_y, id);

if (position_meeting(mouse_x, mouse_y, crop_inst) and mouse_check_button_pressed(mb_left)) {
	instance_create_layer(x,y, "Instances", obj_waterdrop);
}

if (watered == true) {
	var lay_id = layer_get_id("Dirt")
	var map_id = layer_tilemap_get_id(lay_id)
	
	tilemap_set(map_id,30, x/16, y/16)		
} else if (watered == false) {
	var lay_id = layer_get_id("Dirt");
	var map_id = layer_tilemap_get_id(lay_id);
	
	tilemap_set(map_id,28, x/16, y/16);	
}

if (daysWithoutWater >= 3 ) { InstanceDeleteCrop(x, y) }