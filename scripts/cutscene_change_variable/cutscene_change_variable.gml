// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function cutscene_change_variable(_obj, _var_name_string, _value){
	with(_obj) {
		variable_instance_set(id, _var_name_string, _value)
	}
	
	cutscene_end_action();
}