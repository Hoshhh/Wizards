event_inherited();
if (global.oldman != obj_oldman and global.oldman != -1) {
	instance_change(global.oldman, true);	
}

if (did_change == 1) {
	instance_destroy();
	var inst = instance_create_layer(x,y, "Instances", obj_oldman2)
	
	with(inst) {
		global.oldman = obj_oldman2;	
	}
}