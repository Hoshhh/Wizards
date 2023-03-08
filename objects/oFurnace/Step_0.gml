if (show_furn) {
	mousex = device_mouse_x_to_gui(0);
	mousey = device_mouse_y_to_gui(0);

	var cell_xbuffer = cell_size * scale;
	var cell_ybuffer = (cell_size + y_buffer) * scale;

	var i_mousex = mousex - slots_x;
	var i_mousey = mousey - slots_y;


	var nx = i_mousex div cell_xbuffer;
	var ny = i_mousey div cell_ybuffer;


	var output_mousex = mousex - output_x;
	var output_mousey = mousey - output_y;
	

	if (nx >= 0 and nx < furn_slots_width and ny >= 0 and ny < furn_slots_height-1 and i_mousey > 0 and i_mousex > 0)
	{
		var sx = i_mousex - (nx*cell_xbuffer);
		var sy = i_mousey - (ny*cell_ybuffer);
	
		if ((sx < cell_size * scale) and (sy < cell_size * scale))
		{
			m_slotx = nx;
			m_sloty = ny;
		}
		
		mouse_in_furn = true;
	} else { mouse_in_furn = false;}
	
	testx = mouse_in_furn;
	//testy = output_mousey;

	//Set Selected Slot to Mouse Position

	//selected_slot = min(CHEST_SLOTS - 1, m_slotx + (m_sloty * alch_slots_width));

	//testx = output_mousex;
	//testy = output_mousey;

	if ((output_mousex >= 0 and output_mousex <= 15*scale) and (output_mousey >= 0 and output_mousey <= 15*scale)) {
		selected_slot = 1;
		mouse_in_output = true;
	} else {
		selected_slot = min(furn_slots - 2, m_slotx + (m_sloty * furn_slots_width));	
		mouse_in_output = false;
	}
	
	
	//Add the output item to the inventory
	if (selected_slot = 1 and inventory[1].itemInSlot != item.none) {
		if (mouse_check_button_pressed(mb_left)) {
			var didAdd = InventoryAdd(oInventory, inventory[1].itemInSlot, inventory[1].amount)
			//InventorySortByQuality(oInventory.inventory);
			if (didAdd) {
				inventory[1].itemInSlot = item.none;
				inventory[1].amount = 0;
				inventory[1].iname = "";
				inventory[1].quality = 0;
			}
		}
	}
}