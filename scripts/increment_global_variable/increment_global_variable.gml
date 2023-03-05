// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function increment_global_variable(_var, _amount){
	var new_amount = global.oldman_dialogue + _amount;
	variable_global_set(_var, _amount);
}