if (room == rm_creator) exit;
if (instance_exists(obj_cutscene)) exit;
name = global.name;

//If seeds are selected on the toolbar, set variables in the crops object
if (inventory[bar_selected_slot].itemInSlot == item.centauryseeds and room = rm_main and !show_inventory) {
	with(crops) {
		planting = true;
		selectCrop = 0;	
	}
}else if (inventory[bar_selected_slot].itemInSlot == item.wolfsbaneseeds and room = rm_main and !show_inventory) {
	with(crops) {
		planting = true;
		selectCrop = 1;	
	}
} else {
	with(crops) {
		planting = false;	
	}	
}

if (keyboard_check_pressed(ord("E")) || gamepad_button_check_pressed(0, gp_start)) show_inventory = !show_inventory

if (!show_inventory) {
	selected_slot = bar_selected_slot
	if (inventory[bar_selected_prev].amount == 0)
	{
		inventory[bar_selected_prev].itemInSlot = item.none;
	}
	
	exit;
}

mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);

var cell_xbuffer = (cell_size + x_buffer) * scale;
var cell_ybuffer = (cell_size + y_buffer) * scale;

var i_mousex = mousex - slots_x;
var i_mousey = mousey - slots_y;

var nx = i_mousex div cell_xbuffer;
var ny = i_mousey div cell_ybuffer;


mouse_in_inventory = true;
if (nx >= 0 and nx < inv_slots_width and ny >= 0 and ny < inv_slots_height and i_mousey > 0 and i_mousex > 0)
{
	var sx = i_mousex - (nx*cell_xbuffer);
	var sy = i_mousey - (ny*cell_ybuffer);
	
	if ((sx < cell_size * scale) and (sy < cell_size * scale))
	{
		m_slotx = nx;
		m_sloty = ny;
	}
} else { mouse_in_inventory = false;}


//Set Selected Slot to Mouse Position
if (!gamepad_is_connected(0)) {
	selected_slot = min(INVENTORY_SLOTS - 1, m_slotx + (m_sloty * inv_slots_width));
}


//Selecting a side button on the inventory
var b_mousex = mousex - button_x;
var b1_mousey = mousey - button1_y;
var b2_mousey = mousey - button2_y;
var b3_mousey = mousey - button3_y;

testx = b_mousex;
testy = b1_mousey;

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
	if (show_inventory) {
		if (gamepad_button_check_pressed(0, gp_face4)) {
			InventoryAdd(id, irandom_range(1, item.height-1), 100)	
		}
		
		if (inv_selected) {
			mouse_in_inventory = true;
			#region Basic movement in the inventory
		
			//Allow player to move up in the inventory
			if (gamepad_button_check_pressed(0, gp_padu)) {
				InventoryMoveUp();
			}
		
			//Allow the player to move down in the inventory
			if (gamepad_button_check_pressed(0, gp_padd)) {
				InventoryMoveDown();
			}
		
			//Allow the player to move left in the inventory
			if (gamepad_button_check_pressed(0, gp_padl)) {
				InventoryMoveLeft();
			}
		
			//Allow the player to move right in the inventory
			if (gamepad_button_check_pressed(0, gp_padr)) {
				InventoryMoveRight();
			}
		
			#endregion
			#region Moving to Button list
			
				if (gamepad_button_check_pressed(0, gp_shoulderr)) {
					inv_selected = false;
					buttons_selected = true;
					button = 0;
				}
			
			#endregion
			#region Moving to other Inventory
			
			if (oChest.show_chest) {
				if (gamepad_button_check_pressed(0, gp_shoulderrb)) {
					inv_selected = false;
					buttons_selected = false;
					button = -1;
					with(oChest) {
						chest_selected = true;	
						mouse_in_chest = true;
					}
				}
			}
			
			#endregion
		
		} else if (buttons_selected){
			mouse_in_inventory = false;
			#region Basic movement of the side buttons
		
			//Move Up the button list
			if (gamepad_button_check_pressed(0, gp_padu)) {
				InventoryButtonMoveUp();
			}
		
			//Move Down the button list
			if (gamepad_button_check_pressed(0, gp_padd)) {
				InventoryButtonMoveDown();
			}
		
			#endregion
			#region Moving to Inventory
			
				if (gamepad_button_check_pressed(0, gp_shoulderl)) {
					buttons_selected = false;
					inv_selected = true;
					button = -1;
				}
				
			#endregion
			#region Moving to other Inventory
			
			if (oChest.show_chest) {
				if (gamepad_button_check_pressed(0, gp_shoulderrb)) {
					inv_selected = false;
					buttons_selected = false;
					button = -1;
					with(oChest) {
						chest_selected = true;
						mouse_in_chest = true;
					}
				}
			}
			
			#endregion
		}
	}
}






var chest_inst	= instance_nearest(obj_player.x, obj_player.y, oChest);

if (instance_exists(chest_inst) and chest_inst.show_chest == true) {
	inv_ui_x = (gui_width * 0.32) - (inv_ui_width * 0.5 * scale);	
	
	info_x = inv_ui_x;
	info_y = inv_ui_y + (57 * scale);

	slots_x = inv_ui_x + (55 * scale);
	slots_y = inv_ui_y + (7 * scale);
	
	select_x = inv_ui_x + (53 * scale);
	select_y = inv_ui_y + (5 * scale);
	
	//Drawing position based on "centered" alignment
	draw_button_x = inv_ui_x + (163 * scale); 
	draw_button1_y = inv_ui_y + (8 * scale);
	draw_button2_y = inv_ui_y + (18 * scale);
	draw_button3_y = inv_ui_y + (28 * scale);

	//Gui position for the top left x,y values for the buttons
	button_x = inv_ui_x + (157 * scale);
	button1_y = inv_ui_y + (7 * scale);
	button2_y = inv_ui_y + (17 * scale);
	button3_y = inv_ui_y + (27 * scale);
	
	buttons_x = inv_ui_x + (155 * scale);
	buttons_y = inv_ui_y + (2 * scale);
	
	//Gui position for player info (currency/name)
	name_x = inv_ui_x + (6 * scale);
	name_y = inv_ui_y + (66 * scale);

	currency_x = inv_ui_x + (6 * scale);
	currency_y = inv_ui_y + (76 * scale);
} else {
	inv_ui_x = (gui_width * 0.5) - (inv_ui_width * 0.5 * scale);	

	slots_x = inv_ui_x + (55 * scale);
	slots_y = inv_ui_y + (7 * scale);
	
	select_x = inv_ui_x + (53 * scale);
	select_y = inv_ui_y + (5 * scale);
	
	//Drawing position based on "centered" alignment
	draw_button_x = inv_ui_x + (163 * scale); 
	draw_button1_y = inv_ui_y + (8 * scale);
	draw_button2_y = inv_ui_y + (18 * scale);
	draw_button3_y = inv_ui_y + (28 * scale);

	//Gui position for the top left x,y values for the buttons
	button_x = inv_ui_x + (157 * scale);
	button1_y = inv_ui_y + (7 * scale);
	button2_y = inv_ui_y + (17 * scale);
	button3_y = inv_ui_y + (27 * scale);
	
	buttons_x = inv_ui_x + (155 * scale);
	buttons_y = inv_ui_y + (2 * scale);
	
	//Gui position for player info (currency/name)
	name_x = inv_ui_x + (6 * scale);
	name_y = inv_ui_y + (66 * scale);

	currency_x = inv_ui_x + (6 * scale);
	currency_y = inv_ui_y + (76 * scale);
}
