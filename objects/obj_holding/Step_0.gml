mx = mouse_x;
my = mouse_y;

if (instance_exists(obj_player))
{
	x = obj_player.x	
	y = obj_player.y - 24	
}

with(oInventory) {
	if bar_selected_slot != bar_selected_prev or (inventory[bar_selected_slot].amount == 0) {
		show_debug_message("destroying obj_holding")
		instance_destroy(obj_holding);	
	}
	
	
	if show_inventory = true {
		instance_destroy(obj_holding);	
	}
}

var cs = cell_size;
var xx = (mouse_x div cs);
var yy = (mouse_y div cs);

xx = xx*cs;
yy = yy*cs;


#region Placeable objects

var _colChest = collision_rectangle(xx-cs,yy,xx+(cs-1),yy+cs-1, all, false, false);
var _colFurnace = collision_rectangle(xx-cs,yy,xx+(cs-1),yy+cs-1, all, false, false);
var _colSmallShelf = collision_rectangle(xx-4,yy,xx+(cs*2)-9,yy+cs-1, all, false, false);
var _colLargeShelf = collision_rectangle(xx-8,yy,xx+(cs*2)-9,yy+cs-1, all, false, false);


if (_colChest == noone and item_num == item.chest) {
	color = c_green;
	if (mouse_check_button_pressed(mb_left)) {
		with(oInventory) {
			var cs = cell_size;
			var xx = (mouse_x div cs);
			var yy = (mouse_y div cs);

			xx = xx*cs;
			yy = yy*cs;
			
			instance_create_layer(xx, yy + (cs/2), "Instances", oChest)
			inventory[bar_selected_slot].amount -= 1;
		}
	}
} else if (_colFurnace == noone and item_num == item.furnace) {
	color = c_green;
	if (mouse_check_button_pressed(mb_left)) {
		with(oInventory) {
			var cs = cell_size;
			var xx = (mouse_x div cs);
			var yy = (mouse_y div cs);

			xx = xx*cs;
			yy = yy*cs;
			
			instance_create_layer(xx, yy + (cs/2), "Instances", obj)
			inventory[bar_selected_slot].amount -= 1;
		}
	}
} else if (_colLargeShelf == noone and item_num == item.largeshelf) {
	color = c_green;
	if (mouse_check_button_pressed(mb_left)) {
		with(oInventory) {
			var cs = cell_size;
			var xx = (mouse_x div cs);
			var yy = (mouse_y div cs);

			xx = xx*cs;
			yy = yy*cs;
			
			instance_create_layer(xx + (cs/2), yy + (cs/2), "Instances", obj_shelf_large)
			inventory[bar_selected_slot].amount -= 1;
		}
	}
}  else if (_colSmallShelf == noone and item_num == item.smallshelf) {
	color = c_green;
	if (mouse_check_button_pressed(mb_left)) {
		with(oInventory) {
			var cs = cell_size;
			var xx = (mouse_x div cs);
			var yy = (mouse_y div cs);

			xx = xx*cs;
			yy = yy*cs;
			
			instance_create_layer(xx, yy + (cs/2), "Instances", obj_shelf_small)
			inventory[bar_selected_slot].amount -= 1;
		}
	}
}


else { color = c_red }


#endregion
/*
if (_col32 == noone) {
	BuildObject(obj, item_num)
	
	switch(item_num) {
		case item.chest	:
			BuildObject(obj)
		break;
		
		case item.furnace :
			BuildObject(obj)
		break;
	}
} else { color = c_red }