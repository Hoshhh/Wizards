var c = c_black;
if (doTransition) {
	//Handle fade/room transition
	if (room != spawnRoom) {
		blackAlpha += 0.1;
		if (blackAlpha >= 1) { room_goto(spawnRoom) }
	} else {
		blackAlpha -= 0.1;
		if (blackAlpha <= 0) { doTransition = false }
	}
	
	//Drawing fade
	draw_set_alpha(blackAlpha);
	draw_rectangle_color(0,0, gui_width, gui_height, c,c,c,c, false);
	draw_set_alpha(1);
}