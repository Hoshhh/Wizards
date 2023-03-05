/*
current_scene = scene_info[scene]
var _len = array_length(current_scene) - 1;

current_scene_array = -1;
current_scene_array = array_create(_len, 0);
array_copy(current_scene_array, 0, current_scene, 1, _len);