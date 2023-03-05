scene_info = -1;
scene = 0;


black_bar_size_max = display_manager.window_scale * 16;
black_bar_size = 0;

timer = 0;

/*
scene_info = [
	[cutscene_wait, 2],
	[cutscene_move_character, obj_player, 0, 32, true, 1],
	[cutscene_wait, 2],
	[cutscene_move_character, obj_player, 0, -32, true, 1],
	[cutscene_wait, 2],
	[cutscene_move_character, obj_player, 0, 32, true, 1],
	[cutscene_wait, 2],
	[cutscene_dialogue],
	[cutscene_wait, 1],
]*/

//event_perform(ev_other, ev_user0);

x_dest = -1;
y_dest = -1;