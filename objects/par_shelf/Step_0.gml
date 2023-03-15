
inst = instance_nearest(x,y, oShopContainer)

var _colliding = collision_line(x,y,x,y+10, obj_player, false, false) != noone
if (_colliding) {
	if (mouse_check_button_pressed(mb_right) and (instance_exists(oShopContainer))) {
		with(inst) {
			show_shop = true;	
		}
	
		if (oInventory.show_inventory == false) {
			oInventory.show_inventory = true;	
		}
	}
} 

if (!_colliding){
	
	if (inst.show_shop == true) {
		with(inst) {
			show_shop = false;	
		}
	
		if (oInventory.show_inventory == true) {
			oInventory.show_inventory = false;	
		}
	}
}