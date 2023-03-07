if (room = rm_main) {
	if (instance_exists(obj_crop)) {
		with(obj_crop) {
			if (growthStage < maxGrowthStage) {
				if (watered == true) {
					daysOld += 1;
					daysWithoutWater = 0;
				} else { daysWithoutWater += 1 }
				//First growth
				var firstGrowth = 0
				if (daysOld > 0) { firstGrowth = 1; }
			
				growthStage = firstGrowth + (daysOld div growthStageDuration);
			} 
			
			if (growthStage == maxGrowthStage) {
				growthStage = maxGrowthStage;	
				fullyGrown = true;
				alarm[1] = 1;
			}
		}
	}
} else if (ds_crops_data[# 0, 0] != -1) {
	//This where you update crop properties when not in the greenhouse
	var h = ds_grid_height(ds_crops_data);
	var yy = 0; repeat(h) {
		if (ds_crops_data[# 4, yy] == true) {
			ds_crops_data[# 3, yy] += 1;
			ds_crops_data[# 6, yy] = 0;
		} else { 
			if (ds_crops_data[# 7, yy] != true) {
				ds_crops_data[# 6, yy] += 1; 
			}
		}
		yy += 1;
	}
}