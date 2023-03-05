with(par_npc)
{
	can_move = true;	
}

with(display_manager) {
	target = obj_player;	
}

if (instance_exists(obj_cutscene)) {
	with(obj_cutscene) {
		cutscene_end_action();
		obj_player.active_textbox = noone;
	}
}