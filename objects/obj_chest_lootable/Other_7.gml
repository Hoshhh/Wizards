if (sprite_index == spr_chest01_open) {
	image_index = 3;
	image_speed = 0;
	
	if (opened) {
		for (var i = 0; i < array_length(items_produced); i++) {
			var inst = instance_create_layer(x,y, "Instances", obj_item);

			with(inst) {
				var itemdir = irandom_range(240,300);
				var len = 12;
				goal_x = x + lengthdir_x(len, itemdir);
				goal_y = y + lengthdir_y(len, itemdir);

				item_num = other.items_produced[i];
				stack_num = 1;
				x_frame = item_num mod (spr_width/cell_size);
				y_frame = item_num div (spr_width/cell_size);
			}
		
			other.opened = false;
		}	
	}
}