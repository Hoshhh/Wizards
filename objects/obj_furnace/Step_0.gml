inst = instance_nearest(x,y, oFurnace);

var _furnace = collision_line(x,y,x,y+4, obj_player, false, false) != noone

if (_furnace) {
	if (keyboard_check_pressed(ord("F")) and (instance_exists(oFurnace))) {
		with(inst) {
			show_furn = true;	
		}
	
		if (oInventory.show_inventory == false) {
			oInventory.show_inventory = true;	
		}
	}
} else  if (!_furnace){
	if (inst.show_furn == true) {
		with(inst) {
			show_furn = false;	
		}
	
		if (oInventory.show_inventory == true) {
			oInventory.show_inventory = false;	
		}
	}
}