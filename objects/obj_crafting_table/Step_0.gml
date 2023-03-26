inst = instance_nearest(x,y, oCraftingTable);

var _ct = collision_rectangle(x-32,y,x+32,y+8, obj_player, false, false) != noone

if (_ct) {
	if (keyboard_check_pressed(ord("F")) and (instance_exists(oCraftingTable))) {
		with(inst) {
			show_ct = true;	
		}
	}
} else  if (!_ct){
	if (inst.show_ct == true) {
		with(inst) {
			show_ct = false;	
		}
	}
}