var inst = instance_place(x,y, obj_attack);
	
hp -= 20;
flash = 5;
instance_destroy(inst);
state = ENEMYSTATE.CHASE;
	
if (hp == 0) {
	instance_create_layer(x,y, "Instances", obj_smoke);
	instance_destroy();
}

