var c = c_yellow
draw_set_font(fnt_smalldigits);

if (!show_chest) exit;
//draw_text_color(x-200, y+30, "Instance id: " + string(id), c,c,c,c, 1)

///draw_text_color(30,250, "button: " + string(button), c,c,c,c, 1);

/*
for (var j = 0; j < CHEST_SLOTS; j++) {
	var ydist = 20
	draw_text_color(10,ydist*j + 10, string(inventory[j]) + "\n", c,c,c,c, 1);
}*/


draw_sprite_part_ext(
	spr_ch_ui, 0, cell_size, 0, chest_ui_width, chest_ui_height, 
	chest_ui_x, chest_ui_y, scale, scale, c_white, 1);
	
var sx = 0;
var sy = 0;
	
for (var i = 0; i < CHEST_SLOTS; i++) {
	
	var ix = i mod chest_slots_width;
	var iy = i div chest_slots_width;	
	var xx = slots_x + ((cell_size + x_buffer)*ix*scale);
	var yy =  slots_y + ((cell_size + y_buffer)*iy*scale);
	var controller_xx = slots_x + ((cell_size + x_buffer)*ix*scale);
	var controller_yy =  slots_y + ((cell_size + y_buffer)*iy*scale);
	var controller_sx = (oMouse.itemDrag mod spr_chest_items_columns)*cell_size;
	var	controller_sy = (oMouse.itemDrag div spr_chest_items_columns)*cell_size;
	var select_xx = select_x + ((cell_size + x_buffer)*ix*scale);
	var select_yy =  select_y + ((cell_size + y_buffer)*iy*scale);
	
	var iitem = inventory[i].itemInSlot
	if (iitem > 0) {
		sx = (iitem mod spr_chest_items_columns)*cell_size;
		sy = (iitem div spr_chest_items_columns)*cell_size;	
	}
	
	//Draw slots and item
	draw_sprite_part_ext(spr_ch_ui,0,0,0, cell_size, cell_size, xx , yy, scale, scale, c_white, 1);
	
	switch(i) {
	
		case selected_slot: 
			if (iitem > 0) {
				draw_sprite_part_ext(spr_chest_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);	
			}
			
			if (mouse_in_chest) {	
				draw_sprite_ext(spr_inventory_selected,0, select_xx, select_yy, scale, scale, 0, c_white, 1); //Selected sprite
				
				if (oMouse.itemDrag != -1) {
					if (controller = 1) {
						draw_sprite_part_ext(spr_chest_items, 0, controller_sx, controller_sy, cell_size, cell_size, controller_xx+12, controller_yy+12, scale, scale, c_white, 0.7);
					}	
				}
			}
		break;
		
		default: 
			if (iitem > 0) {	
				draw_sprite_part_ext(spr_chest_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);	
			}
		break;
	}
	
	//Draw item number
	if (iitem > 0)
	{
		var number = inventory[i].amount;
		var c = c_white;
		draw_text_transformed_color(xx + (8*scale), yy + (12*scale), string(number), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
	}
}


var button_xx = buttons_x;
var button_yy = buttons_y + (10*button*scale);
if (buttons_selected) {
	draw_sprite_ext(spr_inventory_button_selected,0, button_xx, button_yy, scale, scale, 0, c_white, 1);
}

var c = c_black;
draw_set_font(fnt_test);
draw_set_halign(fa_center);
draw_text_transformed_color(draw_button_x, draw_button1_y, "Sort", 0.115*scale, 0.115*scale, 0, c,c,c,c, 1);
draw_text_transformed_color(draw_button_x, draw_button2_y, "Move", 0.115*scale, 0.115*scale, 0, c,c,c,c, 1);
draw_text_transformed_color(draw_button_x, draw_button3_y, "Menu", 0.115*scale, 0.115*scale, 0, c,c,c,c, 1);
draw_set_halign(fa_left);
draw_set_font(fnt_smalldigits);

if (oMouse.itemDrag != 0) {
	iitem = oMouse.itemDrag;
	sx = (iitem mod spr_chest_items_columns)*cell_size;
	sy = (iitem div spr_chest_items_columns)*cell_size;	
	draw_sprite_part_ext(spr_chest_items, 0, sx, sy, cell_size, cell_size, mousex, mousey, scale, scale, c_white, 0.7);
}