// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function InventoryMoveRight(){
	selected_slot += 1;	
		
	if (selected_slot > INVENTORY_SLOTS - 1) {
		selected_slot = 0;	
	}
}

function InventoryMoveLeft(){
	selected_slot -= 1;	
		
	if (selected_slot < 0) {
		selected_slot = INVENTORY_SLOTS - 1;	
	}
}

function InventoryMoveDown(){
	if (selected_slot+5 <= INVENTORY_SLOTS - 1) {
		selected_slot += 5;	
	}
		
	if (selected_slot > INVENTORY_SLOTS - 1) {
		selected_slot = INVENTORY_SLOTS - 1;	
	}
}

function InventoryMoveUp(){
	if (selected_slot-5 >= 0) {
		selected_slot -= 5;	
	}
		
	if (selected_slot < 0) {
		selected_slot = INVENTORY_SLOTS - 1;	
	}
}

function InventoryButtonMoveDown(){
	if (buttons_selected) {
		button += 1;
				
		if (button > 2) button = 0;
	}
}

function InventoryButtonMoveUp(){
	if (buttons_selected) {
		button -= 1;
				
		if (button < 0) button = 2;
	}
}





function ChestMoveRight(){
	selected_slot += 1;	
		
	if (selected_slot > CHEST_SLOTS - 1) {
		selected_slot = 0;	
	}
}

function ChestMoveLeft(){
	selected_slot -= 1;	
		
	if (selected_slot < 0) {
		selected_slot = CHEST_SLOTS - 1;	
	}
}

function ChestMoveDown(){
	if (selected_slot+5 <= CHEST_SLOTS - 1) {
		selected_slot += 5;	
	}
		
	if (selected_slot > CHEST_SLOTS - 1) {
		selected_slot = CHEST_SLOTS - 1;	
	}
	
	if (buttons_selected) {
		button += 1;
				
		if (button > 2) button = 0;
	}
}

function ChestMoveUp(){
	if (selected_slot-5 >= 0) {
		selected_slot -= 5;	
	}
		
	if (selected_slot < 0) {
		selected_slot = CHEST_SLOTS - 1;	
	}
	
	if (buttons_selected) {
		button -= 1;
				
		if (button < 0) button = 2;
	}
}

function ChestButtonMoveDown(){
	if (buttons_selected) {
		button += 1;
				
		if (button > 2) button = 0;
	}
}

function ChestButtonMoveUp(){
	if (buttons_selected) {
		button -= 1;
				
		if (button < 0) button = 2;
	}
}