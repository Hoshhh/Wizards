for (var i = 0; i < array_length(items_produced); i++) {
	var inst = instance_create_layer(x,y, "Instances", obj_item);

	with(inst) {
		item_num = other.items_produced[i];
		stack_num = 5;
		x_frame = item_num mod (spr_width/cell_size);
		y_frame = item_num div (spr_width/cell_size);
	}
}