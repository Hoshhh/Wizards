if (keyboard_check_pressed(ord("I"))) show_ct = !show_ct

if (show_ct) {

	mousex = device_mouse_x_to_gui(0);
	mousey = device_mouse_y_to_gui(0);

	var cell_xbuffer = (cell_size + x_buffer) * scale;
	var cell_ybuffer = (cell_size + y_buffer) * scale;

	var i_mousex = mousex - slots_x;
	var i_mousey = mousey - slots_y;

	var nx = i_mousex div cell_xbuffer;
	var ny = i_mousey div cell_ybuffer;

	mouse_in_ct = true;
	var mouse_in_output = false;

	var output_mousex = mousex - output_x;
	var output_mousey = mousey - output_y;

	if (nx >= 0 and nx < ct_slots_width-1 and ny >= 0 and ny < ct_slots_height and i_mousey > 0 and i_mousex > 0) ||
		((output_mousex >= 0 and output_mousex <= 15*scale) and (output_mousey >= 0 and output_mousey <= 15*scale))
	{
		var sx = i_mousex - (nx*cell_xbuffer);
		var sy = i_mousey - (ny*cell_ybuffer);
	
		if ((sx < cell_size * scale) and (sy < cell_size * scale))
		{
			m_slotx = nx;
			m_sloty = ny;
		}
	} else { mouse_in_ct = false;}

	//Set Selected Slot to Mouse Position

	//selected_slot = min(CHEST_SLOTS - 1, m_slotx + (m_sloty * ct_slots_width));

	//testx = output_mousex;
	//testy = output_mousey;

	if ((output_mousex >= 0 and output_mousex <= 15*scale) and (output_mousey >= 0 and output_mousey <= 15*scale)) {
		selected_slot = 3;
		mouse_in_output = true;
	} else {
		selected_slot = min(ct_slots - 2, m_slotx + (m_sloty * ct_slots_width));	
		mouse_in_output = false;
	}

	if (!mouse_in_ct){
		selected_slot = -1;
	}

	#region Recipe selectors

	//Selecting a side button on the inventory
	var r_mousex = mousex - recipe_output_x;
	var r1_mousey = mousey - recipe1_y;
	var r2_mousey = mousey - recipe2_y;
	var r3_mousey = mousey - recipe3_y;
	var r4_mousey = mousey - recipe4_y;

	//testx = r_mousex;
	//testy = r2_mousey;


	if ((r_mousex >= 0 and r_mousex <= 83*scale) and (r1_mousey >= 0 and r1_mousey <= 17*scale)) {
		select = 0;
		if (mouse_check_button_pressed(mb_left)) {
			selected = true; 
			recipe_selected = select;
			crafting = false;
		}
	} else if ((r_mousex >= 0 and r_mousex <= 83*scale) and (r2_mousey >= 0 and r2_mousey <= 17*scale)) {
		select = 1;
		if (mouse_check_button_pressed(mb_left)) {
			selected = true; 
			recipe_selected = select;
			crafting = false;
		}
	} else if ((r_mousex >= 0 and r_mousex <= 83*scale) and (r3_mousey >= 0 and r3_mousey <= 17*scale)) {
		select = 2;
		if (mouse_check_button_pressed(mb_left)) {
			selected = true; 
			recipe_selected = select;
			crafting = false;
		}
	} else if ((r_mousex >= 0 and r_mousex <= 83*scale) and (r4_mousey >= 0 and r4_mousey <= 17*scale)) {
		select = 3;
		if (mouse_check_button_pressed(mb_left)) {
			selected = true; 
			recipe_selected = select;
			crafting = false;
		}
	} else {
		select = -1;
	}

	#endregion

	#region Next/Prev Button selectors

	var previous_x = mousex - prev_button_x;
	var previous_y = mousey - prev_button_y;

	var next_x = mousex - next_button_x;
	var next_y = mousey - next_button_y;

	if ((previous_x >= 0 and previous_x <= 11*scale) and (previous_y >= 0 and previous_y <= 5*scale)) {
		prev_selected = true;
	} else {
		prev_selected = false;	
	}

	if ((next_x >= 0 and next_x <= 11*scale) and (next_y >= 0 and next_y <= 5*scale)) {
		next_selected = true;
	} else {
		next_selected = false;	
	}

	#endregion

	#region Craft Button selector

	var craft_x = mousex - craft_button_x;
	var craft_y = mousey - craft_button_y;

	//testx = craft_x;
	//testy = craft_y;

	if ((craft_x >= 0 and craft_x <= 25*scale) and (craft_y >= 0 and craft_y <= 9*scale)) {
		craft_selected = true;
	
		if (mouse_check_button_pressed(mb_left)) {
			if (recipe_page[recipe_selected].unlocked and !crafting) {
				crafting = true;	
			} else if (recipe_page[recipe_selected].unlocked and crafting) {
				crafting = false;	
			}
		}
	} else {
		craft_selected = false;	
	}

	#endregion

	#region Add/Subtract selectors

	var add_x = mousex - add_button_x;
	var add_y = mousey - add_button_y;
	var sub_x = mousex - sub_button_x;
	var sub_y = mousey - sub_button_y;

	if ((add_x >= 0 and add_x <= 11*scale) and (add_y >= 0 and add_y <= 5*scale)) {
		add_selected = true;
	} else {
		add_selected = false;	
	}

	if ((sub_x >= 0 and sub_x <= 11*scale) and (sub_y >= 0 and sub_y <= 5*scale)) {
		sub_selected = true;
		if (mouse_check_button_pressed(mb_left) and sub_selected == true) {
			craft_num--
		}
	} else {
		sub_selected = false;	
	}

	if (craft_num <= 0) {
		craft_num = 0;	
		crafting = false;
	}

	testx = sub_x;
	testy = sub_y;

	#endregion


	//Add the output item to the inventory
	if (selected_slot = 3 and inventory[3].itemInSlot != item.none) {
		if (mouse_check_button_pressed(mb_left)) {
			var didAdd = InventoryAdd(oInventory, inventory[3].itemInSlot, inventory[3].amount)
			InventorySortByQuality(oInventory.inventory);
			if (didAdd) {
				inventory[3].itemInSlot = item.none;
				inventory[3].amount = 0;
			}
		}
	}
}

//Hypotheticals
//need recipe properties to know what to pull from the chests
//recipe_page[recipe_selected]  will need to change based on page too

var _chestNum = instance_number(oChest);
//Chests
if (selected) {
	var _item1AmountTotal = 0;
	var _item2AmountTotal = 0;
	var _item3AmountTotal = 0;
	
	if (recipe_page[recipe_selected].unlocked) {
		inventory[0].itemInSlot = recipe_page[recipe_selected].item1_type;
		inventory[1].itemInSlot = recipe_page[recipe_selected].item2_type;
		inventory[2].itemInSlot = recipe_page[recipe_selected].item3_type;
	} else {
		inventory[0].itemInSlot = item.QuestionMark;
		inventory[1].itemInSlot = item.QuestionMark;
		inventory[2].itemInSlot = item.QuestionMark;
	}
	
	//Get Items from inventory
	with(oInventory) {
		for (var k = 0; k < INVENTORY_SLOTS; k++;) {
			var prev_amount1 = _item1AmountTotal;
			var prev_amount2 = _item2AmountTotal;
			var prev_amount3 = _item3AmountTotal;
			
			if (inventory[k].itemInSlot == other.recipe_page[other.recipe_selected].item1_type) {
				_item1AmountTotal = prev_amount1 + inventory[k].amount;
				other.inventory[0].iname = inventory[k].iname;
				other.inventory[0].quality = inventory[k].quality;
			}
				
			if (inventory[k].itemInSlot == other.recipe_page[other.recipe_selected].item2_type) {
				_item2AmountTotal = prev_amount2 + inventory[k].amount;
				other.inventory[1].iname = inventory[k].iname;
				other.inventory[1].quality = inventory[k].quality;
			} 
				
			if (inventory[k].itemInSlot == other.recipe_page[other.recipe_selected].item3_type) {
				_item3AmountTotal = prev_amount3 + inventory[k].amount;
				other.inventory[2].iname = inventory[k].iname;
				other.inventory[2].quality = inventory[k].quality;
			} 
		}
	}
	
	for(var i = 0; i < _chestNum; i++) {
		var _inst = instance_find(oChest, i);
		
		with(_inst) {	
			for (var j = 0; j < CHEST_SLOTS; j++) {
				var chest_prev_amount1 = _item1AmountTotal;
				var chest_prev_amount2 = _item2AmountTotal;
				var chest_prev_amount3 = _item3AmountTotal;
				
				if (inventory[j].itemInSlot == other.recipe_page[other.recipe_selected].item1_type) {
					_item1AmountTotal = chest_prev_amount1 + inventory[j].amount;
					other.inventory[0].iname = inventory[j].iname;
					other.inventory[0].quality = inventory[j].quality;
				}
				
				if (inventory[j].itemInSlot == other.recipe_page[other.recipe_selected].item2_type) {
					_item2AmountTotal = chest_prev_amount2 + inventory[j].amount;
					other.inventory[1].iname = inventory[j].iname;
					other.inventory[1].quality = inventory[j].quality;
				} 
				
				if (inventory[j].itemInSlot == other.recipe_page[other.recipe_selected].item3_type) {
					_item3AmountTotal = chest_prev_amount3 + inventory[j].amount;
					other.inventory[2].iname = inventory[j].iname;
					other.inventory[2].quality = inventory[j].quality;
				} 
			}
		}
	}
	
	if (recipe_page[recipe_selected].unlocked) {
		inventory[0].amount = _item1AmountTotal;
		inventory[1].amount = _item2AmountTotal;
		inventory[2].amount = _item3AmountTotal;
		
		if (_item1AmountTotal >= recipe_page[recipe_selected].item1_amount * (craft_num+1)) {
			if (mouse_check_button_pressed(mb_left) and add_selected == true) {
				craft_num++	
			}
		}
	} else {
		inventory[0].amount = 0;
		inventory[1].amount = 0;
		inventory[2].amount = 0;
	}
	
	//
	
	if (crafting and (inventory[3].itemInSlot == recipe_page[recipe_selected].output_type || inventory[3].itemInSlot == item.none) and craft_num > 0) {
		crafting_timer++;
		var item1_crafted = false;
		var item2_crafted = false;
		var item3_crafted = false;
		
		if (crafting_timer >= 60) {
			if (inventory[0].amount >= recipe_page[recipe_selected].item1_amount and
				inventory[1].amount >= recipe_page[recipe_selected].item2_amount and
				inventory[2].amount >= recipe_page[recipe_selected].item3_amount ) {
				
				var item1Remainder = 0;
				var item2Remainder = 0;
				var item3Remainder = 0;
				var newChest1 = false;
				var newChest2 = false;
				var newChest3 = false;
			
				with(oInventory) {
					InventorySortByQuality(self.inventory);
					for (var a = 0; a < INVENTORY_SLOTS; a++;) {
						if (item1_crafted == false) {
							if (inventory[a].itemInSlot == other.recipe_page[other.recipe_selected].item1_type) {
								if (inventory[a].amount >= other.recipe_page[other.recipe_selected].item1_amount) {
									inventory[a].amount -= other.recipe_page[other.recipe_selected].item1_amount;
									item1_crafted = true;
								
									if (inventory[a].amount == 0) {
										inventory[a].itemInSlot = item.none;
									}
								} else {
									item1Remainder = abs(inventory[a].amount - other.recipe_page[other.recipe_selected].item1_amount);
									inventory[a].amount = 0;
									newChest1 = true;
								
									if (inventory[a].amount == 0) {
										inventory[a].itemInSlot = item.none;
									}
								}
							}
						}
					
						if (item2_crafted == false) {
							if (inventory[a].itemInSlot == other.recipe_page[other.recipe_selected].item2_type) {
								if (inventory[a].amount >= other.recipe_page[other.recipe_selected].item2_amount) {
									inventory[a].amount -= other.recipe_page[other.recipe_selected].item2_amount;
									item2_crafted = true;
								
									if (inventory[a].amount == 0) {
										inventory[a].itemInSlot = item.none;
									}
								} else {
									item2Remainder = abs(inventory[a].amount - other.recipe_page[other.recipe_selected].item2_amount);
									inventory[a].amount = 0;
									newChest2 = true;
								
									if (inventory[a].amount == 0) {
										inventory[a].itemInSlot = item.none;
									}
								}
							}
						}
					
						if (item3_crafted == false) {
							if (inventory[a].itemInSlot == other.recipe_page[other.recipe_selected].item3_type) {
								if (inventory[a].amount >= other.recipe_page[other.recipe_selected].item3_amount) {
									inventory[a].amount -= other.recipe_page[other.recipe_selected].item3_amount;
									item3_crafted = true;
								
									if (inventory[a].amount == 0) {
										inventory[a].itemInSlot = item.none;
									}
								} else {
									item3Remainder = abs(inventory[a].amount - other.recipe_page[other.recipe_selected].item3_amount);
									inventory[a].amount = 0;
									newChest3 = true;
								
									if (inventory[a].amount == 0) {
										inventory[a].itemInSlot = item.none;
									}
								}
							}
						}
					}
				}
			
				for(var i = 0; i < _chestNum; i++) {
					var _inst = instance_find(oChest, i);
		
					with(_inst) {	
						InventorySortByQuality(_inst.inventory);
						for (var b = 0; b < CHEST_SLOTS; b++;) {
							if (item1_crafted == false || newChest1) {
								if (inventory[b].itemInSlot == other.recipe_page[other.recipe_selected].item1_type) {
									if (inventory[b].amount >= other.recipe_page[other.recipe_selected].item1_amount) {
										if (newChest1) {
											inventory[b].amount -= item1Remainder;	
										} else {
											inventory[b].amount += item1Remainder;
											inventory[b].amount -= other.recipe_page[other.recipe_selected].item1_amount;
										}
										newChest1 = false;
										item1_crafted = true;
										item1Remainder = 0;
									
										if (inventory[b].amount == 0) {
											inventory[b].itemInSlot = item.none;
										}
									} else {
										item1Remainder = abs(inventory[b].amount - other.recipe_page[other.recipe_selected].item1_amount);
										inventory[b].amount = 0;
										newChest1 = true;
									
										if (inventory[b].amount == 0) {
											inventory[b].itemInSlot = item.none;
										}
										break;
									}
								}
							}
						
							if (item2_crafted == false || newChest2) {
								if (inventory[b].itemInSlot == other.recipe_page[other.recipe_selected].item2_type) {
									if (inventory[b].amount >= other.recipe_page[other.recipe_selected].item2_amount) {
										if (newChest2) {
											inventory[b].amount -= item2Remainder;	
										} else {
											inventory[b].amount += item2Remainder;
											inventory[b].amount -= other.recipe_page[other.recipe_selected].item2_amount;
										}
										newChest2 = false;
										item2_crafted = true;
										item2Remainder = 0;
									
										if (inventory[b].amount == 0) {
											inventory[b].itemInSlot = item.none;
										}
									} else {
										item2Remainder = abs(inventory[b].amount - other.recipe_page[other.recipe_selected].item2_amount);
										inventory[b].amount = 0;
										newChest2 = true;
									
										if (inventory[b].amount == 0) {
											inventory[b].itemInSlot = item.none;
										}
										break;
									}
								}
							}
						
							if (item3_crafted == false || newChest3) {
								if (inventory[b].itemInSlot == other.recipe_page[other.recipe_selected].item3_type) {
									if (inventory[b].amount >= other.recipe_page[other.recipe_selected].item3_amount) {
									if (newChest3) {
										inventory[b].amount -= item3Remainder;	
									} else {
										inventory[b].amount += item3Remainder;
										inventory[b].amount -= other.recipe_page[other.recipe_selected].item3_amount;
									}
									newChest3 = false;
									item3_crafted = true;
									item3Remainder = 0;
								
									if (inventory[b].amount == 0) {
											inventory[b].itemInSlot = item.none;
										}
									} else {
										item3Remainder = abs(inventory[b].amount - other.recipe_page[other.recipe_selected].item3_amount);
										inventory[b].amount = 0;
										newChest3 = true;
									
										if (inventory[b].amount == 0) {
											inventory[b].itemInSlot = item.none;
										}
										break;
									}
								}
							}
						}
					}
				}
				inventory[3].itemInSlot = recipe_page[recipe_selected].output_type;
				inventory[3].amount += recipe_page[recipe_selected].output_amount;
				crafting_timer = 0;
				craft_num--;
				item1_crafted = false;
				item2_crafted = false;
				item3_crafted = false;
			}
		}
	}
}