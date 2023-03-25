inst = instance_nearest(x,y, oAlchemy);

var _alchemy = collision_rectangle(x-32,y,x+32,y+8, obj_player, false, false) != noone

if (_alchemy) {
	if (keyboard_check_pressed(ord("F")) and (instance_exists(oAlchemy))) {
		with(inst) {
			show_alch = true;	
		}
	}
} else  if (!_alchemy){
	if (inst.show_alch == true) {
		with(inst) {
			show_alch = false;	
		}
	}
}