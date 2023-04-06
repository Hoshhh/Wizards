var _loot = collision_rectangle(x-32,y,x+32,y+8, obj_player, false, false) != noone
var _open = position_meeting(mouse_x, mouse_y, id)

if (_loot and _open and mouse_check_button_pressed(mb_right)) {
	sprite_index = spr_chest01_open;
	//image_speed = 1;
	opened = true;
}

