
var current_scene = scene_info[scene]
var _len = array_length(current_scene);
var args = array_create(_len-1, 0);
array_copy(args, 0, current_scene, 1, _len-1);
	
script_execute_ext(current_scene[0], args)

if (scene < array_length(scene_info)-1) {
	black_bar_size += 4;
	if (black_bar_size >= black_bar_size_max) {
		black_bar_size = black_bar_size_max;
	}
}

if (scene >= array_length(scene_info)-1) {
	black_bar_size -= 4;
	if (black_bar_size <= 0) {
		black_bar_size = 0;
	}
}
/*
var len = array_length(current_scene) - 1;

switch(len) {
	case 0: script_execute(current_scene[0]); break;	
	case 1: script_execute(current_scene[0], current_scene[1]); break;	
}


/*

	var _len = array_length(current_scene);
	var args = array_create(len-1, 0);
	array_copy(args, 0, current_scene, 1, len-1);
	
	script_execute_ext(current_scene[0], args)
