var picked_up = false;

if (fullyGrown) {
		//InstanceDeleteCrop(mouse_x, mouse_y);
		//pickup item.
			var in = item_produced;
			var sn = 1;
			
			
			with(oInventory)
			{
				var inv = inventory;
				var picked_up = false;
				
				//Check if item exists in inventory already.
				var yy = 0; repeat(INVENTORY_SLOTS)
				{
					if (inv[yy].itemInSlot == in)
					{
						InstanceDeleteCrop(mouse_x, mouse_y);
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
							InstanceDeleteCrop(mouse_x, mouse_y);
							inv[yy].itemInSlot = in;
							inv[yy].amount += sn;
							picked_up = true;
							break;
						} else
						{
							yy += 1;	
						}
					}
				}
			}
}	