//Check if there's at least an item in slots 1 and 2, then run the FindRecipe script which will return the output item
var _inst = self;

if (inventory[0].itemInSlot != item.none) {
	FindOre(inventory[0].itemInSlot, _inst);
}

if (show_furn) {
	mousex = device_mouse_x_to_gui(0);
	mousey = device_mouse_y_to_gui(0);

	var i_mousex = mousex - slots_x;
	var i_mousey = mousey - slots_y;
	
	testx = i_mousex;
	testy = i_mousey;
	
	var output_mousex = mousex - output_x;
	var output_mousey = mousey - output_y;
	
	if ((i_mousex >= 0 and i_mousex <= 16*scale) and (i_mousey >= 0 and i_mousey <= 16*scale)) {
		selected_slot = 0;
		mouse_in_furn = true;
		mouse_in_output = false;
	} else if ((output_mousex >= 0 and output_mousex <= 16*scale) and (output_mousey >= 0 and output_mousey <= 16*scale)) {
		selected_slot = 1;
		mouse_in_output = true;
		mouse_in_furn = false;
	} else {
		selected_slot = -1
		mouse_in_furn = false;
		mouse_in_output = false;
	}

	
	//Add the output item to the inventory
	if (selected_slot = 1 and inventory[1].itemInSlot != item.none and inventory[1].amount != 0) {
		if (mouse_check_button_pressed(mb_left)) {
			var didAdd = InventoryAdd(oInventory, inventory[1].itemInSlot, inventory[1].amount)
			InventoryStackAll(oInventory.inventory);
			if (didAdd) {
				inventory[1].itemInSlot = item.none;
				inventory[1].amount = 0;
				inventory[1].iname = "";
				inventory[1].quality = 0;
			}
		}
	}
}