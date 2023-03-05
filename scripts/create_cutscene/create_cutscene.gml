// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_cutscene(_scene_info, _text, _speakers, _nextline, _scripts){
	var inst = instance_create_layer(0,0, "Instances", obj_cutscene);
	
	with(inst) {
		scene_info = _scene_info;	
		text = _text;
		speakers = _speakers;
		next_line = _nextline;
		scripts = _scripts;
		//event_perform(ev_other, ev_user0);
	}
}