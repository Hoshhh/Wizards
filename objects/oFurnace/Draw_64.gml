var c = c_yellow
draw_set_font(fnt_smalldigits);


if (!show_furn) exit;

/*
for (var j = 0; j < furn_slots; j++) {
	var ydist = 20
	draw_text_color(300,ydist*j + 10, string(inventory[j]) + "\n", c,c,c,c, 1);
}*/

draw_text_color(10,5, "testx: " + string(selected_slot), c,c,c,c, 1);
draw_text_color(10,15, "testy: " + string(testy), c,c,c,c, 1);

draw_sprite_part_ext(
	spr_furn_ui, 0, 0, 0, furn_ui_width, furn_ui_height, 
	furn_ui_x, furn_ui_y, scale, scale, c_white, 1);
	

var sx = 0;
var sy = 0;
	
for (var i = 0; i < furn_slots; i++) {
	var ix = i 
	var iy = i div furn_slots_height;	
	var xx = slots_x;
	var yy =  slots_y + ((cell_size+y_buffer)*ix*scale);
	var select_xx = select_x + ((cell_size + x_buffer)*ix*scale);
	var select_yy =  select_y + ((cell_size + y_buffer)*iy*scale);
	
	var oitem = inventory[1].itemInSlot;
	var ox = (oitem mod spr_furn_items_columns)*cell_size;
	var oy = (oitem div spr_furn_items_columns)*cell_size;
	
	var iitem = inventory[i].itemInSlot
	if (iitem > 0) {
		sx = (iitem mod spr_furn_items_columns)*cell_size;
		sy = (iitem div spr_furn_items_columns)*cell_size;	
	}
	
	
	switch(i) {
	
		case selected_slot: 
			if (iitem > 0 and i < 3) {
				draw_sprite_part_ext(spr_furn_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);	
			}
			
			if (mouse_in_furn and i < 1) {	
				draw_sprite_ext(spr_inventory_selected,0, select_xx, select_yy, scale, scale, 0, c_white, 1); //Selected sprite
			}
		break;
		
		default: 
			if (iitem > 0 and i < 1) {	
				draw_sprite_part_ext(spr_furn_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);	
			}
		break;
	}
	
	//Draw item number
	if (iitem > 0 and i < 1)
	{
		var number = inventory[i].amount;
		var c = c_white;
		draw_text_transformed_color(xx + (8*scale), yy + (12*scale), string(number), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
	}
	
	draw_sprite_part_ext(spr_furn_ui, 0, 18, 12, cell_size, (0+crafting_timer/2),output_x,output_y,scale,scale,c_red,1);
	
	if (oitem > 0) {
		
		if (crafting_timer <= 32) { 
			draw_sprite_part_ext(spr_furn_items, 0,ox,oy,cell_size, cell_size, 
			output_x,output_y, scale, scale, c_white, 0.3
			);
		}
		
		if (inventory[1].amount != 0) {
			draw_sprite_part_ext(
			spr_furn_items, 0,ox,oy,cell_size, cell_size, 
			output_x,output_y, scale, scale, c_white, 1
			);	
		}
	
		if (inventory[1].itemInSlot != item.none) {
			if (mouse_in_output) {
				draw_sprite_ext(spr_inventory_selected,0, output_select_x, output_select_y, scale, scale, 0, c_white, 1);
			}
			
			var number = inventory[1].amount;
			var c = c_white;
			draw_text_transformed_color(output_x + (8*scale), output_y + (12*scale), string(number), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
		}
		
	}
}


