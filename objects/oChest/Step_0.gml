if (!show_chest) exit;

mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);

var cell_xbuffer = (cell_size + x_buffer) * scale;
var cell_ybuffer = (cell_size + y_buffer) * scale;

var i_mousex = mousex - slots_x;
var i_mousey = mousey - slots_y;


var nx = i_mousex div cell_xbuffer;
var ny = i_mousey div cell_ybuffer;


mouse_in_chest = true;
if (nx >= 0 and nx < chest_slots_width and ny >= 0 and ny < chest_slots_height and i_mousey > 0 and i_mousex > 0)
{
	var sx = i_mousex - (nx*cell_xbuffer);
	var sy = i_mousey - (ny*cell_ybuffer);
	
	if ((sx < cell_size * scale) and (sy < cell_size * scale))
	{
		m_slotx = nx;
		m_sloty = ny;
	}
} else { mouse_in_chest = false;}

//Set Selected Slot to Mouse Position
if (!gamepad_is_connected(0)) {
	selected_slot = min(CHEST_SLOTS - 1, m_slotx + (m_sloty * chest_slots_width));
}

//Selecting a side button on the inventory
var b_mousex = mousex - button_x;
var b1_mousey = mousey - button1_y;
var b2_mousey = mousey - button2_y;
var b3_mousey = mousey - button3_y;

if (!gamepad_is_connected(0)) {
	if ((b_mousex >= 0 and b_mousex <= 12.1*scale) and (b1_mousey >= 0 and b1_mousey <= 5.5*scale)) {
		button = 0;	
		buttons_selected = true;
	} else if ((b_mousex >= 0 and b_mousex <= 12.1*scale) and (b2_mousey >= 0 and b2_mousey <= 5.5*scale)) {
		button = 1;
		buttons_selected = true;
	} else if ((b_mousex >= 0 and b_mousex <= 12.1*scale) and (b3_mousey >= 0 and b3_mousey <= 5.5*scale)) {
		button = 2;
		buttons_selected = true;
	} else {
		button = -1;
		buttons_selected = false;
	}
}


if (gamepad_is_connected(0)) {
	controller = 1;
	if (show_chest) {
		
		if (chest_selected) {
			mouse_in_chest = true;
			#region Basic movement in the inventory
		
			//Allow player to move up in the inventory
			if (gamepad_button_check_pressed(0, gp_padu)) {
				ChestMoveUp();
			}
		
			//Allow the player to move down in the inventory
			if (gamepad_button_check_pressed(0, gp_padd)) {
				ChestMoveDown();
			}
		
			//Allow the player to move left in the inventory
			if (gamepad_button_check_pressed(0, gp_padl)) {
				ChestMoveLeft();
			}
		
			//Allow the player to move right in the inventory
			if (gamepad_button_check_pressed(0, gp_padr)) {
				ChestMoveRight();
			}
		
			#endregion
			#region Moving to Button list
			
				if (gamepad_button_check_pressed(0, gp_shoulderr)) {
					chest_selected = false;
					buttons_selected = true;
					button = 0;
				}
			
			#endregion
			#region Moving to other Inventory
			
			if (oInventory.show_inventory) {
				if (gamepad_button_check_pressed(0, gp_shoulderlb)) {
					chest_selected = false;
					buttons_selected = false;
					button = -1;
					with(oInventory) {
						inv_selected = true;
						mouse_in_inventory = true;
					}
				}
			}
			
			#endregion
		
		} else if (buttons_selected){
			mouse_in_chest = false;
			#region Basic movement of the side buttons
		
			//Move Up the button list
			if (gamepad_button_check_pressed(0, gp_padu)) {
				ChestButtonMoveUp();
			}
		
			//Move Down the button list
			if (gamepad_button_check_pressed(0, gp_padd)) {
				ChestButtonMoveDown();
			}
		
			#endregion
			#region Moving to back to Chest
			
				if (gamepad_button_check_pressed(0, gp_shoulderl)) {
					buttons_selected = false;
					chest_selected = true;
					button = -1;
				}
				
			#endregion
			#region Moving to other Inventory
		
			if (oInventory.show_inventory) {
				if (gamepad_button_check_pressed(0, gp_shoulderlb)) {
					chest_selected = false;
					buttons_selected = false;
					button = -1;
					with(oInventory) {
						inv_selected = true;
						mouse_in_inventory = true;
					}
				}
			}
			
			#endregion
		}
	}
}


/*
if (gamepad_is_connected(0)) {
	controller = 1;
	
	//Swap to other inventory
	if (gamepad_button_check_pressed(0, gp_shoulderrb)) {
		chest_selected = true;
		oInventory.inv_selected = false;
		mouse_in_chest = true;
		buttons_selected = false;
	}
	
	if (gamepad_button_check_pressed(0, gp_shoulderlb)) {
		chest_selected = false
		oInventory.inv_selected = true;	
		mouse_in_chest = false;
		buttons_selected = false;
	}
	
	//Swap to side buttons
	if (gamepad_button_check_pressed(0, gp_shoulderr) and chest_selected) {
		buttons_selected = true;
		button = 0;
		
		if (oMouse.inventoryHover != oInventory) {
			chest_selected = false;
		}
	}
	
	if (gamepad_button_check_pressed(0, gp_shoulderl)) {
		buttons_selected = false;
		button = -1;
		
		if (oMouse.inventoryHover != oInventory) {
			chest_selected = true;
			oInventory.inv_selected = false;
		}
	}
	
	if (show_chest and chest_selected) {
		mouse_in_chest = true;	
		if (gamepad_button_check_pressed(0, gp_padr)) {
			ChestMoveRight();
		}
	
		if (gamepad_button_check_pressed(0, gp_padl)) {
			ChestMoveLeft();
		}
	
		if (gamepad_button_check_pressed(0, gp_padd)) {
			ChestMoveDown();
		}
	
		if (gamepad_button_check_pressed(0, gp_padu)) {
			ChestMoveUp();
		}
	} else if (show_chest and buttons_selected) {
		if (gamepad_button_check_pressed(0, gp_padd)) {
			ChestButtonMoveDown();
		}
	
		if (gamepad_button_check_pressed(0, gp_padu)) {
			ChestButtonMoveUp();
		}
	}
} else { controller = 0;}


