var inst = instance_create_layer(x,y, "Instances", obj_item);

with(inst) {
	move_towards_point(obj_player.x, obj_player.y, 3)
	item_num = other.item_produced;
	stack_num = 1;
	x_frame = item_num mod (spr_width/cell_size);
	y_frame = item_num div (spr_width/cell_size);
	created_crop = true;
}