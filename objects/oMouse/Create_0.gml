inventoryHover = -1;
slotHover = -1;
inventoryDrag = -1;
slotDrag = -1;
itemDrag = -1;
itemAmount = 0;

mouseOver = function() {
	global.input_select = mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(0, gp_face1)
	global.input_add_one = mouse_check_button_pressed(mb_right) || gamepad_button_check_pressed(0, gp_face2)
	global.input_split = mouse_check_button_pressed(mb_middle) || gamepad_button_check_pressed(0, gp_face3)
	
	//Empty hover results
	slotHover = -1;
	inventoryHover = -1;
	
	var _chest = instance_nearest(obj_player.x, obj_player.y, oChest);
	var _furnace = instance_nearest(obj_player.x, obj_player.y, oFurnace);
	
	//Check for inventory slot hover
	with(oInventory) {
		if (mouse_in_inventory) {
			other.slotHover = selected_slot;
			other.inventoryHover = id;
		} else if (buttons_selected) {
			other.inventoryHover = id;	
		}
	}
	
	//Check for chest slot hover
	with(_chest) {
		if (mouse_in_chest and show_chest) {
			other.slotHover = selected_slot;
			other.inventoryHover = id;
		} else if (buttons_selected) {
			other.inventoryHover = id;	
		}
	}
	
	//Check for furnace slot hover
	with(_furnace) {
		if ((mouse_in_furn || mouse_in_output) and show_furn) {
			other.slotHover = selected_slot;
			other.inventoryHover = id;
		} 
	}
}

stateFree = function() {
	mouseOver()
	
	var _chest = instance_nearest(obj_player.x, obj_player.y, oChest);
	//Start to drag an item if slot is not empty
	if ((global.input_select) and (slotHover != -1) and (inventoryHover.inventory[slotHover].itemInSlot != -1)) {
		//Enter drag state
		state = stateDrag;
		itemDrag = inventoryHover.inventory[slotHover].itemInSlot;
		itemAmount = inventoryHover.inventory[slotHover].amount;
		inventoryDrag = inventoryHover;
		slotDrag = slotHover;
	}
	
	if (global.input_split and slotHover != -1 and (inventoryHover.inventory[slotHover].itemInSlot != -1)) {
		if (inventoryHover.object_index == oInventory.object_index) {
			for (var i = 0; i < oInventory.INVENTORY_SLOTS; i++) {
				if (inventoryHover.inventory[i].itemInSlot == item.none) {
					InventoryAdd(inventoryHover, inventoryHover.inventory[slotHover].itemInSlot, floor(inventoryHover.inventory[slotHover].amount/2))
					inventoryHover.inventory[slotHover].amount = ceil(inventoryHover.inventory[slotHover].amount/2);
					exit;
				}
			}
		} else if (inventoryHover.object_index == _chest.object_index) {
			for (var i = 0; i < CHEST_SLOTS; i++) {
				if (inventoryHover.inventory[i].itemInSlot == item.none) {
					InventoryAdd(inventoryHover, inventoryHover.inventory[slotHover].itemInSlot, floor(inventoryHover.inventory[slotHover].amount/2))
					inventoryHover.inventory[slotHover].amount = ceil(inventoryHover.inventory[slotHover].amount/2);
					exit;
				}
			}
		}
	}


	with(oInventory) {
		if ((button == 0) and (global.input_select)) {
			//InventoryStackAll(other.inventoryHover.inventory);
			InventorySortByQuality(other.inventoryHover.inventory);	
		}
		
		if (instance_exists(_chest)) {
			if ((button == 1) and (global.input_select) and (_chest.show_chest == true)) {
				InventoryMoveAll(other.inventoryHover, _chest);	
			}
		}
	}
	
	with(_chest) {
		if ((button == 0) and (global.input_select)) {
			InventorySortByQuality(other.inventoryHover.inventory);	
		}
		
		if ((button == 1) and (global.input_select)) {
			InventoryMoveAll(other.inventoryHover, oInventory);	
		}
	}
}

stateDrag = function() {
	mouseOver()
	if (global.input_select) {
		var _furnace = instance_nearest(obj_player.x, obj_player.y, oFurnace);
		if (inventoryHover == _furnace) {
			if (slotHover == 1) {
				inventoryDrag.inventory[slotDrag].itemInSlot = itemDrag;
				slotHover = -1;
			}
		}
			
		//Swap with slot hovering
		if (slotHover != -1) {
			
			if (itemDrag != inventoryHover.inventory[slotHover].itemInSlot) {
				InventorySwap(inventoryDrag, slotDrag, inventoryHover, slotHover)
			} else if (itemDrag == inventoryHover.inventory[slotHover].itemInSlot and inventoryDrag == inventoryHover) {
				//show_debug_message("true") 
				if (slotDrag != slotHover) {
					InventoryStack(inventoryHover, itemDrag, slotDrag, slotHover)
				}
			} else if (itemDrag == inventoryHover.inventory[slotHover].itemInSlot) {
				InventoryToOtherStack(inventoryDrag, slotDrag, inventoryHover, slotHover)	
			}
		} else {
			inventoryDrag.inventory[slotDrag].itemInSlot = -1;
			inventoryDrag.inventory[slotDrag].amount = 0;
			inventoryDrag.inventory[slotDrag].iname = "";
			inventoryDrag.inventory[slotDrag].quality = 0;
			
			//Create the item.
			var inst = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_item);
			with(inst){
				//InventoryRemove(other.inventoryDrag, other.slotDrag, other.itemAmount)
				item_num = other.itemDrag; 
				stack_num = other.itemAmount
				//other.itemDrag = -1;
				//other.itemAmount = 0;
				x_frame = item_num mod (spr_width/cell_size);
				y_frame = item_num div (spr_width/cell_size);	
				pickup_timer = 60;
			}	
		}
		
		//Return to free state
		state = stateFree;
		itemDrag = -1;
		inventoryDrag = -1;
		slotDrag = -1;
	}
	
	if (global.input_add_one) {
		if (inventoryHover.inventory[slotHover].itemInSlot == item.none || inventoryHover.inventory[slotHover].itemInSlot == itemDrag) {
			InventoryAddOne(inventoryDrag, inventoryHover, itemDrag, slotDrag, slotHover);
		}
	}
	
}

state = stateFree