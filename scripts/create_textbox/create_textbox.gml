///@description create_textbox
///@arg text
///@arg speakers
///@arg next_line
///@arg scripts
function create_textbox() {

	var tbox = instance_create_layer(0,0,"Text", obj_textbox);
	oInventory.show_inventory = false;

	with(tbox)
	{
		text = argument[0];
		speakers = argument[1];
		next_line = argument[2];
		scripts = argument[3];
	
		var len = array_length(text)
		var i = 0; repeat(len)
		{
			names[i] = speakers[i].npc_name;
			portraits[i] = speakers[i].port_index;
			voices[i] = speakers[i].voice;
			i++;
		}
		event_perform(ev_other, ev_user1);
	}

	return tbox;


}