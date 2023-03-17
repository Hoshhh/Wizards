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
			var create_notification = false;
			slot = 0;
			
			if (other.inventory[other.slot].itemInSlot == item.none) {	
				other.slot += 1;
				if (other.slot >= other.shop_slots) {
					other.slot = 0;	
				}
			}
			
			if (other.inventory[other.slot].amount >= other.sellsPerHour) {
				create_notification = true;
				if (create_notification) {
					#region Create notification
					if (!instance_exists(obj_notification)) { instance_create_layer(0,0, "Instances", obj_notification) }
				
					var in = other.inventory[other.slot].itemInSlot;
					var sn = other.sellsPerHour;
					with(obj_notification) {
						sell = true;
						//Create_grid
						if (!ds_exists(ds_notifications, ds_type_grid)) {
							ds_notifications = ds_grid_create(2,1);
							var not_grid = ds_notifications;
							not_grid[# 0, 0] += sn;
							not_grid[# 1, 0] = oInventory.item_info[in].iname;
						} else {
							//Add to grid
							event_perform(ev_other, ev_user4);
						
							var not_grid = ds_notifications;
							var grid_height = ds_grid_height(not_grid);
							var item_name = oInventory.item_info[in].iname;
							var in_grid = false;
						
							var yy = 0; repeat(grid_height) {
								//If we are already in the grid
								if (item_name == not_grid[# 1, yy]) {
									not_grid[# 0, yy] += sn;	
									in_grid = true;
									break;
								}
								yy++;
							}
						
							if (!in_grid) {
								ds_grid_resize(not_grid, 2, grid_height+1);
								not_grid[# 0, grid_height] += sn;
								not_grid[# 1, grid_height] = oInventory.item_info[in].iname;
							}
						}
					}
					#endregion
				}
				
				other.inventory[other.slot].amount -= other.sellsPerHour;
				oInventory.currency += other.sellsPerHour * other.inventory[other.slot].sell
			} else if (other.inventory[other.slot].amount < other.sellsPerHour) {
				create_notification = true;
				if (create_notification) {
					#region Create notification
					if (!instance_exists(obj_notification)) { instance_create_layer(0,0, "Instances", obj_notification) }
				
					var in = other.inventory[other.slot].itemInSlot;
					var sn = other.inventory[other.slot].amount;
					with(obj_notification) {
						sell = true;
						//Create_grid
						if (!ds_exists(ds_notifications, ds_type_grid)) {
							ds_notifications = ds_grid_create(2,1);
							var not_grid = ds_notifications;
							not_grid[# 0, 0] += sn;
							not_grid[# 1, 0] = oInventory.item_info[in].iname;
						} else {
							//Add to grid
							event_perform(ev_other, ev_user4);
						
							var not_grid = ds_notifications;
							var grid_height = ds_grid_height(not_grid);
							var item_name = oInventory.item_info[in].iname;
							var in_grid = false;
						
							var yy = 0; repeat(grid_height) {
								//If we are already in the grid
								if (item_name == not_grid[# 1, yy]) {
									not_grid[# 0, yy] += sn;	
									in_grid = true;
									break;
								}
								yy++;
							}
						
							if (!in_grid) {
								ds_grid_resize(not_grid, 2, grid_height+1);
								not_grid[# 0, grid_height] += sn;
								not_grid[# 1, grid_height] = oInventory.item_info[in].iname;
							}
						}
					}
					#endregion
				}
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
					create_notification = true;
					if (create_notification) {
						#region Create notification
						if (!instance_exists(obj_notification)) { instance_create_layer(0,0, "Instances", obj_notification) }
				
						var in = other.inventory[other.slot].itemInSlot;
						var sn = remainder;
						with(obj_notification) {
							sell = true;
							//Create_grid
							if (!ds_exists(ds_notifications, ds_type_grid)) {
								ds_notifications = ds_grid_create(2,1);
								var not_grid = ds_notifications;
								not_grid[# 0, 0] += sn;
								not_grid[# 1, 0] = oInventory.item_info[in].iname;
							} else {
								//Add to grid
								event_perform(ev_other, ev_user4);
						
								var not_grid = ds_notifications;
								var grid_height = ds_grid_height(not_grid);
								var item_name = oInventory.item_info[in].iname;
								var in_grid = false;
						
								var yy = 0; repeat(grid_height) {
									//If we are already in the grid
									if (item_name == not_grid[# 1, yy]) {
										not_grid[# 0, yy] += sn;	
										in_grid = true;
										break;
									}
									yy++;
								}
						
								if (!in_grid) {
									ds_grid_resize(not_grid, 2, grid_height+1);
									not_grid[# 0, grid_height] += sn;
									not_grid[# 1, grid_height] = oInventory.item_info[in].iname;
								}
							}
						}
						#endregion
					}
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