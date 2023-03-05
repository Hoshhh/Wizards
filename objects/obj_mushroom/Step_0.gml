event_inherited();


if (mouse_check_button_pressed(mb_right)){
	var _mushroom = instance_place(mouse_x, mouse_y, obj_mushroom)
	instance_destroy(_mushroom);
}
