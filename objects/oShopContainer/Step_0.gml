if (room == rm_creator) exit;
if (instance_exists(obj_cutscene)) exit;

//Automatic selling of potions
//Sells only made between 10am - 8pm
//Sells 10% of total stock every hour
//If total stock changes, sell 10% from the new total

with(daycycle) {
	//if (time_pause) exit;
	if (hours >= 10 and hours <= 20) {
		if (floor(hours) == hours) {
			//floor(other.total_stock * 0.10);
			var remainder = 0;
			slot = 0;
			
			if (other.inventory[other.slot].itemInSlot == item.none) {	
				other.slot += 1;
				
				if (other.slot >= other.shop_slots) {
					other.slot = 0;	
				}
			}
			
			if (other.inventory[other.slot].amount >= other.sellsPerHour) {
				other.inventory[other.slot].amount -= other.sellsPerHour;
				oInventory.currency += other.sellsPerHour * other.inventory[other.slot].sell
			} else if (other.inventory[other.slot].amount < other.sellsPerHour) {
				//When the current slot has less than the sells per hour
				remainder = other.sellsPerHour - other.inventory[other.slot].amount;
				oInventory.currency += other.inventory[other.slot].amount * other.inventory[other.slot].sell
				other.inventory[other.slot].amount = 0;	
				
				//Remove item if amount is 0
				if (other.inventory[other.slot].amount = 0) {
					other.inventory[other.slot].itemInSlot = item.none;	
					other.inventory[other.slot].iname = "";	
					other.inventory[other.slot].quality = 0;	
					other.inventory[other.slot].obj = noone;
					other.inventory[other.slot].sell = 0;
				}
				
				//Adjust slot
				other.slot += 1;
				
				if (other.inventory[other.slot].itemInSlot != item.none) {
					oInventory.currency += remainder * other.inventory[other.slot].sell;
					other.inventory[other.slot].amount -= remainder;
				}
			}
			
			if (other.inventory[other.slot].amount = 0) {
				other.inventory[other.slot].itemInSlot = item.none;	
				other.inventory[other.slot].iname = "";	
				other.inventory[other.slot].quality = 0;	
				other.inventory[other.slot].obj = noone;
				other.inventory[other.slot].sell = 0;
			}
		}
	}
}

if (!show_shop) exit;

mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);

var cell_xbuffer = (cell_size + x_buffer) * scale;
var cell_ybuffer = (cell_size + y_buffer) * scale;

var i_mousex = mousex - slots_x;
var i_mousey = mousey - slots_y;

var nx = i_mousex div cell_xbuffer;
var ny = i_mousey div cell_ybuffer;


mouse_in_shop = true;
if (nx >= 0 and nx < shop_slots_width and ny >= 0 and ny < shop_slots_height and i_mousey > 0 and i_mousex > 0)
{
	var sx = i_mousex - (nx*cell_xbuffer);
	var sy = i_mousey - (ny*cell_ybuffer);
	
	if ((sx < cell_size * scale) and (sy < cell_size * scale))
	{
		m_slotx = nx;
		m_sloty = ny;
	}
} else { mouse_in_shop = false;}


//Set Selected Slot to Mouse Position
selected_slot = min(shop_slots - 1, m_slotx + (m_sloty * shop_slots_width));


var len = array_length(inventory);
if !array_equals(inventory, new_array) {
	total_stock = 0;
	for(var i=0; i < array_length(inventory); i++) {
		if (inventory[i].itemInSlot != item.none) {
			total_stock += inventory[i].amount;	
			array_copy(new_array, 0, inventory, 0, len);
		}
	}
}