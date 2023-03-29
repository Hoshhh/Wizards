if (upgraded >= 1 and bounced == 0) {
		if (instance_exists(enemy)) {  
			var xx = other.x;
			var yy = other.y;
			other.x = x+10000;
			other.y = y+10000;
			var inst = instance_nearest(x,y,enemy);
			
			if ((inst.x <= obj_player.x + 48) and (inst.x >= obj_player.x - 48) and (inst.y <= obj_player.y + 48) and (inst.y >= obj_player.y - 48)) {
				with(instance_create_layer(x - 50, y-50, "Instances", obj_attack)) {
					instance_create_layer(x, y, "Instances", obj_smoke)
					target = inst;
					bounced = 1;
					move_towards_point(inst.x, inst.y, 4);
					image_angle = point_direction(x,y, inst.x, inst.y);
				}
			} else {
				other.x = xx;
				other.y = yy;
				inst = other
				
				with(instance_create_layer(x - 50, y-50, "Instances", obj_attack)) {
					instance_create_layer(x, y, "Instances", obj_smoke)
					target = inst;
					bounced = 1;
					move_towards_point(inst.x, inst.y, 4);
					image_angle = point_direction(x,y, inst.x, inst.y);
				}
			}
			
			other.x = xx;
			other.y = yy;
		} 
}

if (upgraded == 2 and bounced == 1) {
		if (instance_exists(enemy)) {  
			var xx = other.x;
			var yy = other.y;
			other.x = x+10000;
			other.y = y+10000;
			var inst = instance_nearest(x,y,enemy);

			if ((inst.x <= obj_player.x + 48) and (inst.x >= obj_player.x - 48) and (inst.y <= obj_player.y + 48) and (inst.y >= obj_player.y - 48)) {
				with(instance_create_layer(x - 50, y-50, "Instances", obj_attack)) {
					instance_create_layer(x, y, "Instances", obj_smoke)
					target = inst;
					bounced = 2;
					move_towards_point(inst.x, inst.y, 4);
					image_angle = point_direction(x,y, inst.x, inst.y);
				}
			} else {
				other.x = xx;
				other.y = yy;
				inst = other
				
				with(instance_create_layer(x - 50, y-50, "Instances", obj_attack)) {
					instance_create_layer(x, y, "Instances", obj_smoke)
					target = inst;
					bounced = 2;
					move_towards_point(inst.x, inst.y, 4);
					image_angle = point_direction(x,y, inst.x, inst.y);
				}
			}
			
			other.x = xx;
			other.y = yy;
		} 
}