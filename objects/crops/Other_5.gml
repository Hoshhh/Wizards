if (room == rm_main) {
	var inst_num = instance_number(obj_crop)	
	
	if (inst_num == 0) {
		//No data
		ds_grid_clear(ds_crops_data, -1)
		
	} else {
		//There is crops, so save their data
		ds_grid_resize(ds_crops_data, ds_grid_width(ds_crops_data), inst_num)
		
		//Loop through the instance grid
		var gw = ds_grid_width(ds_crops_instances);
		var gh = ds_grid_height(ds_crops_instances);
		var slot = 0;
		
		var xx = 0; repeat(gw) {
			var yy = 0; repeat(gh) {
				var inst = ds_crops_instances[# xx, yy];
				
				//If there is an instance in the cell, save its data
				if (inst != 0) {
					ds_crops_data[# 0, slot] = xx;	
					ds_crops_data[# 1, slot] = yy;	
					ds_crops_data[# 2, slot] = inst.cropType;	
					ds_crops_data[# 3, slot] = inst.daysOld;
					ds_crops_data[# 4, slot] = inst.watered;
					ds_crops_data[# 5, slot] = inst.item_produced;
					ds_crops_data[# 6, slot] = inst.daysWithoutWater;
					ds_crops_data[# 7, slot] = inst.fullyGrown;
					
					slot += 1;
				}
				yy += 1;
			}
			
			xx += 1;
		}
		
	}
	ds_grid_destroy(ds_crops_instances);
}