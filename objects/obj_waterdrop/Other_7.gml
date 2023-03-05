if (upgraded == 0) {
	var inst_crop = instance_nearest(x,y, obj_crop)
	inst_crop.watered = true;	

	with(inst_crop) {
		if (watered == true) {
			var lay_id = layer_get_id("Dirt")
			var map_id = layer_tilemap_get_id(lay_id)
	
			tilemap_set(map_id,7, x, y)		
		}
	}
	instance_destroy();
}

if (upgraded == 1) {
	for(var i = 1; i < waterNum + 1; i++) {
		var inst_crop = instance_nth_nearest(x,y, obj_crop, i)
		inst_crop.watered = true;	

		with(inst_crop) {
			if (watered == true) {
				var lay_id = layer_get_id("Dirt")
				var map_id = layer_tilemap_get_id(lay_id)
	
				tilemap_set(map_id,7, x, y)		
			}
		}
		instance_destroy();
	}
}


if (upgraded == 2) {
		obj_crop.watered = true;	

		with(obj_crop) {
			if (watered == true) {
				var lay_id = layer_get_id("Dirt")
				var map_id = layer_tilemap_get_id(lay_id)
	
				tilemap_set(map_id,7, x, y)		
			}
		}
		instance_destroy();	
}