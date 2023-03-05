// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function cutscene_dialogue(argument0,argument1,argument2){
	var inst = instance_nearest(obj_player.x, obj_player.y, par_npc)
	
	if (obj_player.active_textbox == noone) {
		if (inst != noone)
		{
			with(inst)
			{
				var tbox = create_textbox(text, speakers, next_line, scripts);
				with(tbox) {
					//cutscene_end_action();	
				}
				
			}
			obj_player.active_textbox = tbox;
		}
	}
	
}