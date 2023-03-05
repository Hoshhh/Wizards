// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function cutscene_change_xscale(_obj, _xscale){
	
	var arg;
	var i = 0; repeat(argument_count) {
		arg[i] = argument[i];
		i++;
	}
	
	if (argument_count > 1) {
		with(_obj) {
			image_xscale = _xscale;	
		}
	} else {
		with(_obj) {
			image_xscale = -image_xscale;	
		}	
	}
	
	cutscene_end_action();
}