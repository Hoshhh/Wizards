function InventorySearch(rootObject, itemType) {
	if (rootObject.object_index == oInventory.object_index) {
		for (var i = 0; i < oInventory.INVENTORY_SLOTS; i++) {
			if (rootObject.inventory[i].itemInSlot == itemType) {
				return(i);
				//
			}
		}
	} else if (rootObject.object_index == oChest.object_index) {
		for (var i = 0; i < CHEST_SLOTS; i++) {
			if (rootObject.inventory[i].itemInSlot == itemType) {
				return(i);
			}
		}
	}
	return(-1);
}

function InventoryRemove(rootObject, itemType, _amount) {
	var _slot = InventorySearch(rootObject, itemType);
	if (_slot != -1) {
		with(rootObject) {
			inventory[_slot].amount -= _amount;
			
			if (inventory[_slot].amount <= 0) {
				inventory[_slot].itemInSlot = -1;	
			}
		}
		return true;
	} else return false;
}

function InventoryAdd(rootObject, itemType, _amount) {
	var _slot = InventorySearch(rootObject, -1);
	if (_slot != -1) {
		with(rootObject) {
			inventory[_slot].itemInSlot = itemType;
			inventory[_slot].amount = _amount;
			inventory[_slot].iname = oInventory.item_info[itemType].iname;
			inventory[_slot].quality = oInventory.item_info[itemType].quality;
			inventory[_slot].obj = oInventory.item_info[itemType].obj;	
		}
		return true;
	} else return false;
}

function InventorySwap(objectFrom, slotFrom, objectTo, slotTo) {
	var _itemFrom = objectFrom.inventory[slotFrom]
	objectFrom.inventory[slotFrom] = objectTo.inventory[slotTo];
	objectTo.inventory[slotTo] = _itemFrom;
}

function InventoryStack(rootObject, itemType, _slotFrom, _slotTo) {
	rootObject.inventory[_slotTo].itemInSlot = itemType;
	rootObject.inventory[_slotTo].amount += rootObject.inventory[_slotFrom].amount;
	rootObject.inventory[_slotTo].iname = rootObject.inventory[_slotFrom].iname;	
	rootObject.inventory[_slotTo].quality = rootObject.inventory[_slotFrom].quality;
	rootObject.inventory[_slotTo].obj = rootObject.inventory[_slotFrom].obj;
	
	rootObject.inventory[_slotFrom].itemInSlot = -1;
	rootObject.inventory[_slotFrom].amount -= rootObject.inventory[_slotFrom].amount;
	rootObject.inventory[_slotFrom].iname = "";	
	rootObject.inventory[_slotFrom].quality = 0;
	rootObject.inventory[_slotFrom].obj = noone;
}

function InventoryToOtherStack(objectFrom, slotFrom, objectTo, slotTo) {
	objectTo.inventory[slotTo].itemInSlot = objectFrom.inventory[slotFrom].itemInSlot;
	objectTo.inventory[slotTo].amount += objectFrom.inventory[slotFrom].amount;
	objectTo.inventory[slotTo].iname = objectFrom.inventory[slotFrom].iname;
	objectTo.inventory[slotTo].quality = objectFrom.inventory[slotFrom].quality;
	objectTo.inventory[slotTo].obj = objectFrom.inventory[slotFrom].obj;

	
	objectFrom.inventory[slotFrom].itemInSlot = -1;
	objectFrom.inventory[slotFrom].amount = 0;
	objectFrom.inventory[slotFrom].iname = "";
	objectFrom.inventory[slotFrom].quality = 0;
	objectFrom.inventory[slotFrom].obj = noone;
	
}

function InventoryMoveAll(objectFrom, objectTo) {
	for(var i = 0; i < array_length(objectFrom.inventory); i++) {
		
		for(var j = 0; j < array_length(objectTo.inventory); j++) {
			if (objectFrom.inventory[i].itemInSlot == objectTo.inventory[j].itemInSlot) {
				show_debug_message("true") 
				objectTo.inventory[j].amount += objectFrom.inventory[i].amount;
			
				objectFrom.inventory[i].itemInSlot = item.none;	
				objectFrom.inventory[i].amount = 0;
				objectFrom.inventory[i].iname = "";	
				objectFrom.inventory[i].quality = 0;
				objectFrom.inventory[i].quality = noone;
			} else if (objectTo.inventory[j].itemInSlot == item.none) {
				objectTo.inventory[j].itemInSlot = objectFrom.inventory[i].itemInSlot;	
				objectTo.inventory[j].amount += objectFrom.inventory[i].amount;
				objectTo.inventory[j].iname = objectFrom.inventory[i].iname;
				objectTo.inventory[j].quality = objectFrom.inventory[i].quality;
				objectTo.inventory[j].obj = objectFrom.inventory[i].obj;
			
				objectFrom.inventory[i].itemInSlot = item.none;	
				objectFrom.inventory[i].amount = 0;	
				objectFrom.inventory[i].iname = "";	
				objectFrom.inventory[i].quality = 0;
				objectFrom.inventory[i].obj = noone;
			}
		}
		
	}
}

function InventorySortByQuality(rootInventory) {
	InventoryStackAll(rootInventory);
	
	array_sort(rootInventory, function(a, b) {
		if (a.quality == b.quality) {
			return b.amount - a.amount;
		}
		return b.quality - a.quality;
	});	
	
}

function InventoryAddOne(objectFrom, objectTo, itemType, _slotFrom, _slotTo) {
	objectTo.inventory[_slotTo].itemInSlot = itemType;
	objectTo.inventory[_slotTo].amount += 1;
	objectTo.inventory[_slotTo].iname = objectFrom.inventory[_slotFrom].iname;	
	objectTo.inventory[_slotTo].quality = objectFrom.inventory[_slotFrom].quality;
	objectTo.inventory[_slotTo].obj = objectFrom.inventory[_slotFrom].obj;
	
	objectFrom.inventory[_slotFrom].amount -= 1;
	
	if (objectFrom.inventory[_slotFrom].amount <= 0) {
		objectFrom.inventory[_slotFrom].itemInSlot = item.none;
		objectFrom.inventory[_slotFrom].amount = 0;
		objectFrom.inventory[_slotFrom].iname = "";	
		objectFrom.inventory[_slotFrom].quality = 0;
		objectFrom.inventory[_slotFrom].obj = noone;
		
		//Return to free state
		state = stateFree;
		itemDrag = -1;
		inventoryDrag = -1;
		slotDrag = -1;
	}
}

function InventoryStackAll(rootInventory) {
	for (var k = 0; k < array_length(rootInventory); k++) {
		for (var l = 0; l < array_length(rootInventory); l++) {
			if (rootInventory[l].itemInSlot == rootInventory[k].itemInSlot and l != k) {
				rootInventory[k].amount += rootInventory[l].amount;
				
				rootInventory[l].itemInSlot = -1;
				rootInventory[l].amount -= rootInventory[l].amount;
				rootInventory[l].iname = "";
				rootInventory[l].quality = 0;
				rootInventory[l].obj = noone;
			} 
		}
	}
}