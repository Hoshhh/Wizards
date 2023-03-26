if (room == rm_creator) exit;
if (instance_exists(obj_cutscene)) exit;
if (!show_shop) exit;

var c = c_yellow
draw_set_font(fnt_smalldigits);

/*
draw_text_color(10,210, "_slot: " + string(slot), c,c,c,c, 1);

for (var j = 0; j < shop_slots; j++) {
	var ydist = 20
	draw_text_color(300,ydist*j + 10, string(inventory[j]) + "\n", c,c,c,c, 1);
}*/


draw_sprite_part_ext(
	spr_ui, 0, cell_size, 0, shop_ui_width, shop_ui_height, 
	shop_ui_x, shop_ui_y, scale, scale, c_white, 1);
	
var sx = 0;
var sy = 0;
	
for (var i = 0; i < shop_slots; i++) {
	
	var ix = i mod shop_slots_width;
	var iy = i div shop_slots_width;	
	var xx = slots_x + ((cell_size + x_buffer)*ix*scale);
	var yy =  slots_y + ((cell_size + y_buffer)*iy*scale);	
	var select_xx = select_x + ((cell_size + x_buffer)*ix*scale);
	var select_yy =  select_y + ((cell_size + y_buffer)*iy*scale);
	
	var iitem = inventory[i].itemInSlot
	if (iitem > 0) {
		sx = (iitem mod spr_shop_items_columns)*cell_size;
		sy = (iitem div spr_shop_items_columns)*cell_size;	
	}
	
	//Draw slots and item
	draw_sprite_part_ext(spr_ui,0,0,0, cell_size, cell_size, xx , yy, scale, scale, c_white, 1);
	
	switch(i) {
	
		case selected_slot: 
			if (iitem > 0) {
				draw_sprite_part_ext(spr_shop_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);	
			}
			
			if (mouse_in_shop) {	
				draw_sprite_ext(spr_inventory_selected,0, select_xx, select_yy, scale, scale, 0, c_white, 1); //Selected sprite
			}
		break;
		
		default: 
			if (iitem > 0) {	
				draw_sprite_part_ext(spr_shop_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);	
			}
		break;
	}
	
	//Draw item number
	if (iitem > 0)
	{
		var number = inventory[i].amount;
		var c = c_white;
		draw_text_transformed_color(xx + (9*scale), yy + (12*scale), string(number), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
	}
}