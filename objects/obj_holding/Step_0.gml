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

var _col = collision_rectangle(xx, yy, xx+cs-1, yy+cs-1, all, false, false);

if (_col == noone and item_num == item.chest) {
	color = c_green;
	if (mouse_check_button_pressed(mb_left)) {
		with(oInventory) {
			var cs = cell_size;
			var xx = (mouse_x div cs);
			var yy = (mouse_y div cs);

			xx = xx*cs;
			yy = yy*cs;
			
			with(instance_create_layer(xx + (cs/2), yy + (cs/2), "Instances", oChest)) {
				 instance_create_layer(x, y, "Instances", obj_chest)	
			}
			
			inventory[bar_selected_slot].amount -= 1;
		}
	}
} else { color = c_red }

#endregion