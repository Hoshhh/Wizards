
if (instance_exists(customizer)) {
	global.coloring = {
		skin: customizer.skinChoice,
		hat: customizer.hatChoice,
		body: customizer.bodyChoice,
		staff: customizer.staffChoice
	}
}

if (keyboard_check_pressed(ord("G"))) { debug = !debug}
roomWidth = room_width;
roomHeight = room_height;