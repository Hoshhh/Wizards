var px = obj_player.x;
var py = obj_player.y
var r = 2;

pickup_timer--;

if (created_crop) {
	move_towards_point(px, py, 3);
	
	//var crop_inst = instance_place(px, py, obj_item)
	if (point_in_rectangle(px,py,x-r,y-r,x+r,y+r)) {
		instance_destroy(self)	
	}
}


if (drop_move and !created_crop)
{
	x = lerp(x, goal_x, 0.2);	
	y = lerp(y, goal_y, 0.2);	
	
	if (abs(x - goal_x) < 1 and abs(y - goal_y) < 1)
	{
		drop_move = false;	
	}
} else {
	if (pickup_timer > 1) exit;
	
	var px = obj_player.x;
	var py = obj_player.y
	var r = 24;
	
	if (point_in_rectangle(px,py,x-r,y-r,x+r,y+r))
	{
		//Are we on top of the player?
		r = 2;
		if (! point_in_rectangle(px,py,x-r,y-r,x+r,y+r))
		{
			//Move towards the player for pickup.
			x = lerp(x, px, 0.1);	
			y = lerp(y, py, 0.1);
		}
		else
		{
			//pickup item.
			var in = item_num;
			var sn = stack_num;
			
			
			with(oInventory)
			{
				var inv = inventory;
				var info = item_info;
				var picked_up = false;
				
				//Check if item exists in inventory already.
				var yy = 0; repeat(INVENTORY_SLOTS)
				{
					if (inv[yy].itemInSlot == in)
					{
						inv[yy].amount += sn;
						picked_up = true;
						break;
					} else {
						yy += 1;	
					}
					
				}
				//Otherwise, add item to an empty slot if there is one.
				if (!picked_up)
				{
					yy = 0; repeat(INVENTORY_SLOTS)
					{
						if (inv[yy].itemInSlot == item.none)
						{
							inv[yy].itemInSlot = in;
							inv[yy].amount += sn;
							inv[yy].iname = info[in].iname;
							inv[yy].quality = info[in].quality;
							picked_up = true;
							break;
						} else
						{
							yy += 1;	
						}
					}
				}
			}
			
			//Destroy item if picked up
			if (picked_up)
			{
				#region Create notification
				if (!instance_exists(obj_notification)) { instance_create_layer(0,0, "Instances", obj_notification) }
				
				var in = item_num;
				var sn = stack_num;
				with(obj_notification) {
					drop = true;
					//
					//Create_grid
					if (!ds_exists(ds_notifications, ds_type_grid)) {
						ds_notifications = ds_grid_create(4,1);
						var not_grid = ds_notifications;
						not_grid[# 0, 0] += sn;
						not_grid[# 1, 0] = oInventory.item_info[in].iname;
						not_grid[# 2, 0] = in mod (spr_width/cell_size)
						not_grid[# 3, 0] = in div (spr_width/cell_size);	
					} else {
						//Add to grid
						event_perform(ev_other, ev_user3);
						
						var not_grid = ds_notifications;
						var grid_height = ds_grid_height(not_grid);
						var item_name = oInventory.item_info[in].iname;
						var in_grid = false;
						
						var yy = 0; repeat(grid_height) {
							//If we are already in the grid
							if (item_name == not_grid[# 1, yy]) {
								not_grid[# 0, yy] += sn;	
								not_grid[# 2, yy] = in mod (spr_width/cell_size)
								not_grid[# 3, yy] = in div (spr_width/cell_size);
								in_grid = true;
								break;
							}
							yy++;
						}
						
						if (!in_grid) {
							ds_grid_resize(not_grid, 4, grid_height+1);
							not_grid[# 0, grid_height] += sn;
							not_grid[# 1, grid_height] = oInventory.item_info[in].iname;
							not_grid[# 2, grid_height] = in mod (spr_width/cell_size)
							not_grid[# 3, grid_height] = in div (spr_width/cell_size);
						}
					}
				}
				#endregion
				
				instance_destroy();
				show_debug_message("Picked up an item.")
				pickup_timer = 0;
			}
		}
	}
}