var c = c_yellow
draw_set_font(fnt_smalldigits);

if (!show_alch) exit;

draw_text_color(10,5, "add_x: " + string(testx), c,c,c,c, 1);
draw_text_color(10,15, "add_y: " + string(testy), c,c,c,c, 1);

draw_sprite_part_ext(
	spr_alch_ui, 0, 0, 0, alch_ui_width, alch_ui_height, 
	alch_ui_x, alch_ui_y, scale, scale, c_white, 1);
	
var sx = 0;
var sy = 0;
	
for (var i = 0; i < alchemy_slots; i++) {
	
	var ix = i mod alch_slots_width;
	var iy = i div alch_slots_width;	
	var xx = slots_x + ((cell_size + x_buffer)*ix*scale);
	var yy =  slots_y + ((cell_size + y_buffer)*iy*scale);
	var select_xx = select_x + ((cell_size + x_buffer)*ix*scale);
	var select_yy =  select_y + ((cell_size + y_buffer)*iy*scale);
	
	var oitem = inventory[3].itemInSlot;
	var ox = (oitem mod spr_alch_items_columns)*cell_size;
	var oy = (oitem div spr_alch_items_columns)*cell_size;
	
	var iitem = inventory[i].itemInSlot
	if (iitem > 0) {
		sx = (iitem mod spr_alch_items_columns)*cell_size;
		sy = (iitem div spr_alch_items_columns)*cell_size;	
	}
	
	
	switch(i) {
	
		case selected_slot: 
			if (iitem > 0 and i < 3) {
				draw_sprite_part_ext(spr_alch_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);	
			}
			
			if (mouse_in_alch and i < 3) {	
				draw_sprite_ext(spr_inventory_selected,0, select_xx, select_yy, scale, scale, 0, c_white, 1); //Selected sprite
			}
		break;
		
		default: 
			if (iitem > 0 and i < 3) {	
				draw_sprite_part_ext(spr_alch_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);	
			}
		break;
	}
	
	//Draw item number
	if (iitem > 0 and i < 3)
	{
		if (inventory[i].itemInSlot != item.QuestionMark) {
			var number = inventory[i].amount;
			var c = c_white;
			draw_text_transformed_color(xx + (8*scale), yy + (12*scale), string(number), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
		}
	}
	
	if (oitem > 0) {
		if (inventory[3].itemInSlot != item.none) {
			
			var number = inventory[3].amount;
			var c = c_white;
		
			draw_sprite_part_ext(
			spr_alch_items, 0,ox,oy,cell_size, cell_size, 
			output_x,output_y, scale, scale, c_white, 1
			);
		
			draw_text_transformed_color(output_x + (8*scale), output_y + (12*scale), string(number), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
		}
	}
}

if (selected_slot = 3) {
	draw_sprite_ext(spr_inventory_selected,0, output_select_x, output_select_y, scale, scale, 0, c_white, 1);
}


var recipe_select_xx = recipe1_select_x;
var recipe_select_yy = recipe_select_y + (20*select*scale);

if (select >= 0) {
	draw_sprite_ext(spr_recipe_select,0, recipe_select_xx, recipe_select_yy, scale, scale, 0, c_white, 1);
}

if (selected) {
	var recipe_select_yy = recipe_select_y + (20*recipe_selected*scale);
	draw_sprite_ext(spr_recipe_select, 1, recipe_select_xx, recipe_select_yy, scale, scale, 0, c_white, 1);
}

if (prev_selected == true) {
	draw_sprite_ext(spr_small_select, 0, prev_select_x, prev_select_y, scale, scale, 0, c_white, 1);
}

if (next_selected == true) {
	draw_sprite_ext(spr_small_select, 0, next_select_x, next_select_y, scale, scale, 0, c_white, 1);
}

if (craft_selected == true) {
	draw_sprite_ext(spr_craft_select, 0, craft_selected_x, craft_selected_y, scale, scale, 0, c_white, 1);
}

if (add_selected == true) {
	draw_sprite_ext(spr_small_select, 0, add_selected_x, add_selected_y, scale, scale, 0, c_white, 1);
}

if (sub_selected == true) {
	draw_sprite_ext(spr_small_select, 0, sub_selected_x, sub_selected_y, scale, scale, 0, c_white, 1);
}

#region Recipe side

var recipe_output_sx = 0;
var recipe_output_sy = 0;

var recipe_item1_sx = 0;
var recipe_item1_sy = 0;

var recipe_item2_sx = 0;
var recipe_item2_sy = 0;

var recipe_item3_sx = 0;
var recipe_item3_sy = 0;


//For the recipes per page
for (var j = 0; j < array_length(recipe_page); j++) {
	if (recipe_page[j].unlocked) {
		var output_item = recipe_page[j].output_type;
		var item1 = recipe_page[j].item1_type;
		var item2 = recipe_page[j].item2_type;
		var item3 = recipe_page[j].item3_type;
	} else {
		var output_item = item.QuestionMark;
		var item1 = item.QuestionMark;
		var item2 = item.QuestionMark;
		var item3 = item.QuestionMark;	
	}
	
	var output_xx = recipe_output_x + (1*scale);
	var recipe1_yy = recipe1_y + (1*scale);
	var recipe2_yy = recipe2_y + (1*scale);
	var recipe3_yy = recipe3_y + (1*scale);
	var recipe4_yy = recipe4_y + (1*scale);
	
	var item1_xx = recipe_item1_x + (1*scale);
	var item2_xx = recipe_item2_x + (1*scale);
	var item3_xx = recipe_item3_x + (1*scale);
	
	#region setting x and y positions of the which sprite to show
	if (output_item > 0) {
		recipe_output_sx = (output_item mod spr_alch_items_columns)*cell_size;
		recipe_output_sy = (output_item div spr_alch_items_columns)*cell_size;	
	}
	
	if (item1 > 0) {
		recipe_item1_sx = (item1 mod spr_alch_items_columns)*cell_size;
		recipe_item1_sy = (item1 div spr_alch_items_columns)*cell_size;	
	}
	
	if (item2 > 0) {
		recipe_item2_sx = (item2 mod spr_alch_items_columns)*cell_size;
		recipe_item2_sy = (item2 div spr_alch_items_columns)*cell_size;	
	}
	
	if (item3 > 0) {
		recipe_item3_sx = (item3 mod spr_alch_items_columns)*cell_size;
		recipe_item3_sy = (item3 div spr_alch_items_columns)*cell_size;	
	}
	#endregion
	
	
	if (j == 0) {
		if (output_item > 0) {	
			draw_sprite_part_ext(spr_alch_items, 0, recipe_output_sx, recipe_output_sy, cell_size, cell_size, output_xx, recipe1_yy, scale, scale, c_white, 1);	
			
			if (recipe_page[j].unlocked) {
				var number = recipe_page[0].output_amount;
				var c = c_white;
				draw_text_transformed_color(output_xx + (12*scale), recipe1_yy + (12*scale), string(number), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
			}
		}
	
		if (item1 > 0) {	
			draw_sprite_part_ext(spr_alch_items, 0, recipe_item1_sx, recipe_item1_sy, cell_size, cell_size, item1_xx, recipe1_yy, scale, scale, c_white, 1);	
		
			if (recipe_page[j].unlocked) {
				var number = recipe_page[0].item1_amount;
				var c = c_white;
				draw_text_transformed_color(item1_xx + (12*scale), recipe1_yy + (12*scale), string(number), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
			}
		}
		
		if (item2 > 0) {	
			draw_sprite_part_ext(spr_alch_items, 0, recipe_item2_sx, recipe_item2_sy, cell_size, cell_size, item2_xx, recipe1_yy, scale, scale, c_white, 1);	
		
			if (recipe_page[j].unlocked) {
				var number = recipe_page[0].item2_amount;
				var c = c_white;
				draw_text_transformed_color(item2_xx + (12*scale), recipe1_yy + (12*scale), string(number), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
			}
		}
		
		if (item3 > 0) {	
			draw_sprite_part_ext(spr_alch_items, 0, recipe_item3_sx, recipe_item3_sy, cell_size, cell_size, item3_xx, recipe1_yy, scale, scale, c_white, 1);	
			
			if (recipe_page[j].unlocked) {
				var number = recipe_page[0].item3_amount;
				var c = c_white;
				draw_text_transformed_color(item3_xx + (12*scale), recipe1_yy + (12*scale), string(number), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
			}
		}
	}
	
	if (j == 1) {
		if (output_item > 0) {	
			draw_sprite_part_ext(spr_alch_items, 0, recipe_output_sx, recipe_output_sy, cell_size, cell_size, output_xx, recipe2_yy, scale, scale, c_white, 1);	
			
			if (recipe_page[j].unlocked) {
				var number = recipe_page[1].output_amount;
				var c = c_white;
				draw_text_transformed_color(output_xx + (12*scale), recipe2_yy + (12*scale), string(number), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
			}
		}
	
		if (item1 > 0) {	
			draw_sprite_part_ext(spr_alch_items, 0, recipe_item1_sx, recipe_item1_sy, cell_size, cell_size, item1_xx, recipe2_yy, scale, scale, c_white, 1);	
			
			if (recipe_page[j].unlocked) {
				var number = recipe_page[1].item1_amount;
				var c = c_white;
				draw_text_transformed_color(item1_xx + (12*scale), recipe2_yy + (12*scale), string(number), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
			}
		}
		
		if (item2 > 0) {	
			draw_sprite_part_ext(spr_alch_items, 0, recipe_item2_sx, recipe_item2_sy, cell_size, cell_size, item2_xx, recipe2_yy, scale, scale, c_white, 1);	
			
			if (recipe_page[j].unlocked) {
				var number = recipe_page[1].item2_amount;
				var c = c_white;
				draw_text_transformed_color(item2_xx + (12*scale), recipe2_yy + (12*scale), string(number), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
			}
		}
		
		if (item3 > 0) {	
			draw_sprite_part_ext(spr_alch_items, 0, recipe_item3_sx, recipe_item3_sy, cell_size, cell_size, item3_xx, recipe2_yy, scale, scale, c_white, 1);	
		
			if (recipe_page[j].unlocked) {
				var number = recipe_page[1].item3_amount;
				var c = c_white;
				draw_text_transformed_color(item3_xx + (12*scale), recipe2_yy + (12*scale), string(number), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
			}
		}
	}
	
	if (j == 2) {
		if (output_item > 0) {	
			draw_sprite_part_ext(spr_alch_items, 0, recipe_output_sx, recipe_output_sy, cell_size, cell_size, output_xx, recipe3_yy, scale, scale, c_white, 1);	
			
			if (recipe_page[j].unlocked) {
				var number = recipe_page[2].output_amount;
				var c = c_white;
				draw_text_transformed_color(output_xx + (12*scale), recipe3_yy + (12*scale), string(number), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
			}
		}
	
		if (item1 > 0) {	
			draw_sprite_part_ext(spr_alch_items, 0, recipe_item1_sx, recipe_item1_sy, cell_size, cell_size, item1_xx, recipe3_yy, scale, scale, c_white, 1);	
			
			if (recipe_page[j].unlocked) {
				var number = recipe_page[2].item1_amount;
				var c = c_white;
				draw_text_transformed_color(item1_xx + (12*scale), recipe3_yy + (12*scale), string(number), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
			}
		}
		
		if (item2 > 0) {	
			draw_sprite_part_ext(spr_alch_items, 0, recipe_item2_sx, recipe_item2_sy, cell_size, cell_size, item2_xx, recipe3_yy, scale, scale, c_white, 1);	
			
			if (recipe_page[j].unlocked) {
				var number = recipe_page[2].item2_amount;
				var c = c_white;
				draw_text_transformed_color(item2_xx + (12*scale), recipe3_yy + (12*scale), string(number), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
			}
		}
		
		if (item3 > 0) {	
			draw_sprite_part_ext(spr_alch_items, 0, recipe_item3_sx, recipe_item3_sy, cell_size, cell_size, item3_xx, recipe3_yy, scale, scale, c_white, 1);	
			
			if (recipe_page[j].unlocked) {
				var number = recipe_page[2].item3_amount;
				var c = c_white;
				draw_text_transformed_color(item3_xx + (12*scale), recipe3_yy + (12*scale), string(number), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
			}
		}
	}
	
	if (j == 3) {
		if (output_item > 0) {	
			draw_sprite_part_ext(spr_alch_items, 0, recipe_output_sx, recipe_output_sy, cell_size, cell_size, output_xx, recipe4_yy, scale, scale, c_white, 1);	
			
			if (recipe_page[j].unlocked) {
				var number = recipe_page[3].output_amount;
				var c = c_white;
				draw_text_transformed_color(output_xx + (12*scale), recipe4_yy + (12*scale), string(number), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
			}
		}
	
		if (item1 > 0) {	
			draw_sprite_part_ext(spr_alch_items, 0, recipe_item1_sx, recipe_item1_sy, cell_size, cell_size, item1_xx, recipe4_yy, scale, scale, c_white, 1);	
		
			if (recipe_page[j].unlocked) {
				var number = recipe_page[3].item1_amount;
				var c = c_white;
				draw_text_transformed_color(item1_xx + (12*scale), recipe4_yy + (12*scale), string(number), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
			}
		}
		
		if (item2 > 0) {	
			draw_sprite_part_ext(spr_alch_items, 0, recipe_item2_sx, recipe_item2_sy, cell_size, cell_size, item2_xx, recipe4_yy, scale, scale, c_white, 1);	
		
			if (recipe_page[j].unlocked) {
				var number = recipe_page[3].item2_amount;
				var c = c_white;
				draw_text_transformed_color(item2_xx + (12*scale), recipe4_yy + (12*scale), string(number), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
			}
		}
		
		if (item3 > 0) {	
			draw_sprite_part_ext(spr_alch_items, 0, recipe_item3_sx, recipe_item3_sy, cell_size, cell_size, item3_xx, recipe4_yy, scale, scale, c_white, 1);	
			
			if (recipe_page[j].unlocked) {
				var number = recipe_page[3].item3_amount;
				var c = c_white;
				draw_text_transformed_color(item3_xx + (12*scale), recipe4_yy + (12*scale), string(number), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
			}
		}
	}
	
}

#endregion


var c = c_white;
draw_set_font(fnt_test);
draw_set_halign(fa_center);
draw_text_transformed_color(num_x, num_y, string(craft_num), 0.115*scale, 0.115*scale, 0, c,c,c,c, 1);
draw_set_halign(fa_left);
draw_set_font(fnt_smalldigits);


if (oMouse.itemDrag != 0) {
	iitem = oMouse.itemDrag;
	sx = (iitem mod spr_alch_items_columns)*cell_size;
	sy = (iitem div spr_alch_items_columns)*cell_size;	
	draw_sprite_part_ext(spr_alch_items, 0, sx, sy, cell_size, cell_size, mousex, mousey, scale, scale, c_white, 0.7);
}