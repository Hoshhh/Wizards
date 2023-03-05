// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function cutscene_instance_create(_x, _y, _layer, _obj){
	var inst = instance_create_layer(_x, _y, _layer, _obj);
	
	cutscene_end_action();
	
	return inst;
}