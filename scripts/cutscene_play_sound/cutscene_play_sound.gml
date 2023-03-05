// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function cutscene_play_sound(_snd, _prio, _loop){
	audio_play_sound(_snd, _prio, _loop);
	
	cutscene_end_action();
}