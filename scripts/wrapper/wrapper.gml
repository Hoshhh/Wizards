///@description cutscene_change_variable
///@arg obj 
///@arg var_as_string
///@arg value
///@arg obj2 
///@arg var_as_string2
///@arg value2
function wrapper(argument0, argument1, argument2, argument3, argument4, argument5){
	change_variable(argument0, argument1, argument2);
	change_variable(argument3, argument4, argument5);
}