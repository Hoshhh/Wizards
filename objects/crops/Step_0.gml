if (room != rm_main) {planting = false; exit}

#region Planting

if (planting) {
	mx = mouse_x;
	my = mouse_y;
	
	
	if (selectCrop > sprite_get_number(spr_crops_picked)-1) { selectCrop = 0 }
	else if (selectCrop < 0) { selectCrop = sprite_get_number(spr_crops_picked)-1 }
	
	if (mouse_check_button_pressed(mb_left)) {
		InstanceCreateCrop(mx, my, selectCrop);
	}	
}

#endregion

if (instance_exists(obj_crop) and keyboard_check_pressed(ord("X"))) {
	with(obj_crop) {
		if (growthStage < maxGrowthStage) {
			daysOld += 1;
			
			//First growth
			var firstGrowth = 0
			if (daysOld > 0) { firstGrowth = 1; }
			
			growthStage = firstGrowth + (daysOld div growthStageDuration);
			
			if (growthStage == maxGrowthStage) {
				growthStage = maxGrowthStage;	
				fullyGrown = true;
				alarm[1] = 1;
			}
		}
	}
}
