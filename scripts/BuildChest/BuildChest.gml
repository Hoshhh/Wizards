// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function BuildChest(){
	color = c_green;
	if (mouse_check_button_pressed(mb_left)) {
		with(oInventory) {
			var cs = cell_size;
			var xx = (mouse_x div cs);
			var yy = (mouse_y div cs);

			xx = xx*cs;
			yy = yy*cs;
			
			with(instance_create_layer(xx + (cs/2)-8, yy + (cs/2), "Instances", oChest)) {
				 instance_create_layer(x, y, "Instances", obj_chest)	
			}
			
			inventory[bar_selected_slot].amount -= 1;
		}
	}
}