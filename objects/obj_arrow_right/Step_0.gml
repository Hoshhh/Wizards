var _inst = instance_nearest(x,y, obj_colors)

if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id)) {	
	_inst.image_index += 1;
	if (_inst.image_index >= (sprite_get_number(spr_colors)) and mouse_check_button_pressed(mb_left)) {
		_inst.image_index = 0;
	}
	
}