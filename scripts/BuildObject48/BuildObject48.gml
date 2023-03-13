// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function BuildObject48(_obj, _item){
	color = c_green;
	if (mouse_check_button_pressed(mb_left)) {
		var cs = cell_size;
		var xx = (mouse_x div cs);
		var yy = (mouse_y div cs);

		xx = xx*cs;
		yy = yy*cs;
			
		var _inst = instance_create_layer(mouse_x, mouse_y, "Instances", _obj)
		
		with(_inst) {
			switch(_item) {
				case item.smallshelf : 
				case item.smallhortable :
				case item.smallverttable :
					_inst.shop_slots = 2;	
					if (_item == item.smallshelf) {
						instance_create_layer(x,y, "Instances", obj_shelf_small);
					} else if (_item == item.smallhortable) {
						instance_create_layer(x,y, "Instances", obj_horizontal_small);
					} else if (_item == item.smallverttable) {
						instance_create_layer(x,y, "Instances", obj_vertical_small);
					} 
				break;
			
				case item.largeshelf :
				case item.largehortable :
				case item.largeverttable :
					_inst.shop_slots = 4;	
					if (_item == item.largeshelf) {
						instance_create_layer(x,y, "Instances", obj_shelf_large);
					} else if (_item == item.largehortable) {
						instance_create_layer(x,y, "Instances", obj_horizontal_large);
					} else if (_item == item.largeverttable) {
						instance_create_layer(x,y, "Instances", obj_vertical_large);
					}
				break;
			}
		}
		
		with(oInventory) {
			inventory[bar_selected_slot].amount -= 1;
		}
	}
}