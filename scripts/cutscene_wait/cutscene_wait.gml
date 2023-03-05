// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function cutscene_wait(_seconds){
	timer++;
	obj_player.spr = spr_idle;
	
	if (timer >= _seconds * room_speed) {
		timer = 0;
		cutscene_end_action();
	}
}