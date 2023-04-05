// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AddNoti(_item, _num){
	#region Create notification
	if (!instance_exists(obj_notification)) { instance_create_layer(0,0, "Instances", obj_notification) }
		with(obj_notification) {
			drop = true;
					//
			//Create_grid
			if (!ds_exists(ds_notifications, ds_type_grid)) {
				ds_notifications = ds_grid_create(4,1);
				var not_grid = ds_notifications;
				not_grid[# 0, 0] += _num;
				not_grid[# 1, 0] = oInventory.item_info[_item].iname;
				not_grid[# 2, 0] = _item mod (spr_width/cell_size)
				not_grid[# 3, 0] = _item div (spr_width/cell_size);	
			} else {
				//Add to grid
				event_perform(ev_other, ev_user3);
						
				var not_grid = ds_notifications;
				var grid_height = ds_grid_height(not_grid);
				var item_name = oInventory.item_info[_item].iname;
				var in_grid = false;
						
				var yy = 0; repeat(grid_height) {
					//If we are already in the grid
					if (item_name == not_grid[# 1, yy]) {
						not_grid[# 0, yy] += _num;	
						not_grid[# 2, yy] = _item mod (spr_width/cell_size)
						not_grid[# 3, yy] = _item div (spr_width/cell_size);
						in_grid = true;
						break;
					}
					yy++;
				}
						
				if (!in_grid) {
					ds_grid_resize(not_grid, 4, grid_height+1);
					not_grid[# 0, grid_height] += _num;
					not_grid[# 1, grid_height] = oInventory.item_info[_item].iname;
					not_grid[# 2, grid_height] = _item mod (spr_width/cell_size)
					not_grid[# 3, grid_height] = _item div (spr_width/cell_size);
				}
			}
		}
	#endregion
}