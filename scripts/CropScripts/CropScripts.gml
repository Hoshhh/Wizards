function CreateCropType(growth_stage_duration, cost){
	var argNum = argument_count;
	
	if (!ds_exists(ds_crops_types, ds_type_grid)) {
		ds_crops_types = ds_grid_create(argNum, 1);
		var height = 1;
	} else {
		var height = ds_grid_height(ds_crops_types)	
		ds_grid_resize(ds_crops_types, argNum, height+1);
		height += 1;
	}
	
	var yy = height-1
	var i=0; repeat(argNum) {
		ds_crops_types[# i,yy] =	argument[i]
		i += 1;
	} 
}


function InstanceCreateCrop(_x,_y,_crop_type){
	var cs = crops.cellSize;
	var gx = _x div cs;
	var gy = _y div cs;
	var i_grid = crops.ds_crops_instances;
	var cell = i_grid[# gx, gy];
	var xx = gx*cs;
	var yy = gy*cs;
	var _col = instance_position( xx+(cs/2)-2,yy+(cs/2)+2, obj_collision );
	var _noBuild = instance_position( xx+(cs/2)-2,yy+(cs/2)+2, noBuildZone )
	
	if(cell == 0 and _col == noone and _noBuild == noone) {
		var xx = gx*cs;
		var yy = gy*cs;
	
		//check for soil
		var lay_id = layer_get_id("Dirt");
		var map_id = layer_tilemap_get_id(lay_id);
		var data = tilemap_get_at_pixel(map_id, _x, _y);
		
		global.test = data;
	
		if (data == 0) {
			show_debug_message("There is no soil here")	
			return false
		} else {
			show_debug_message("there is soil here")	
		}
	
		var inst = instance_create_layer(xx+(cs/2)-2,yy+(cs/2)+2, "Instances", obj_crop); 
		i_grid[# gx, gy] = inst

		//give the crop its characteristics
		with(inst){
			cropType = 	_crop_type;
			growthStageDuration = crops.ds_crops_types[# 0, cropType];
			item_produced = _crop_type + 24 //15 is the start of the crop items in the inventory and crop type shopuld be 0-1
		}
		
		
		//Remove a seed from the inventory when planted
		with(oInventory) {
			inventory[bar_selected_slot].amount -= 1;	
			//If the amount of seeds is zero or less, remove the seeds from the inventory
			if (inventory[bar_selected_slot].amount <= 0) {
				inventory[bar_selected_slot].itemInSlot = item.none;
			}
		}
		return inst;
	} else {
		show_debug_message("There is already something there.")	
		return false;
	}
}
	
	
function InstanceDeleteCrop(_x,_y){
	var cs = crops.cellSize;
	var gx = _x div cs;
	var gy = _y div cs;
	var i_grid = crops.ds_crops_instances;
	var cell = i_grid[# gx, gy];
	
	if(cell != 0) {
		var xx = gx*cs;
		var yy = gy*cs	
	
		var inst = instance_position(xx+(cs/2)-2,yy+(cs/2)+2, obj_crop); 
		i_grid[# gx, gy] = 0

		//give the crop its characteristics
		with(inst){
			//global.playerXp.herbologyXp += 10;
			instance_destroy(inst);
		}
	} else {
		show_debug_message("Nothing to remove.")	
		return false;
	}
}
	
	
function RespawnCrop( grid_x, grid_y, crop_type, days_old, _watered, _item, _daysWithoutWater, _fullyGrown){
	var xx = (grid_x * cellSize) - 2;
	var yy = (grid_y * cellSize) + 2;
	
	
	//Create instance
	var inst = instance_create_layer(xx+(cellSize/2), yy+(cellSize/2), "Instances", obj_crop);
	ds_crops_instances[# grid_x, grid_y] = inst;
	show_debug_message("Respawned a " + ds_crops_types[# 2, crop_type])
	
	//Give crop its characteristics
	with(inst) {
		cropType = crop_type;
		daysOld = days_old;
		growthStageDuration = crops.ds_crops_types[# 0, cropType];
		watered = _watered;
		item_produced = _item;
		daysWithoutWater = _daysWithoutWater;
		fullyGrown = _fullyGrown;
	}
	
	return inst;
}