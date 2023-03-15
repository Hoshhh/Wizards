// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function BuildObject(_obj, _item){
	color = c_white;
	if (mouse_check_button_pressed(mb_left)) {
		var cs = cell_size;
		var xx = (mouse_x div cs);
		var yy = (mouse_y div cs);

		xx = xx*cs;
		yy = yy*cs;
		if (snap) {
			var _inst = instance_create_layer(xx, yy + (cs), "Instances", _obj)
		} else {
			var _inst = instance_create_layer(mx, my, "Instances", _obj)
		}
		
		with(_inst) {
			switch(_item) {
				case item.smallshelf : 
					_inst.shop_slots = 2;	
					if (_item == item.smallshelf) {
						instance_create_layer(x,y, "Instances", obj_shelf_small);
					}
				break;
			
				case item.largeshelf :
					_inst.shop_slots = 4;	
					if (_item == item.largeshelf) {
						instance_create_layer(x,y, "Instances", obj_shelf_large);
					}
				break;
			}
		}
		
		with(oInventory) {
			inventory[bar_selected_slot].amount -= 1;
		}
	}
}