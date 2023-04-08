if (room == rm_creator) exit;
if (instance_exists(obj_cutscene)) exit;

var c = c_yellow
//draw_text_color(10,10, "mousex: " + string(mousex), c,c,c,c, 1);
//draw_text_color(10,30, "mousey: " + string(mousey), c,c,c,c, 1);

#region Toolbar

var c = c_yellow
draw_set_font(fnt_smalldigits);
//------Toolbar back
draw_sprite_part_ext(spr_bar_ui, 0, 0, 0, bar_ui_width, bar_ui_height,
						bar_ui_x, bar_ui_y, bar_scale, bar_scale, c_white, 1);
					
var ii, ix, iy, xx, yy, sx, sy, iitem, inv_grid
ii = 0; ix = 0; iy = 0; inv_grid = inventory;
c = c_white;


repeat(bar_slots)
{
	//x, y locations for slot
	xx = bar_slots_x + ((cell_size + tb_x_buffer)*ix*bar_scale);
	yy = bar_slots_y + ((cell_size)*iy*bar_scale);
	
	var bar_select_xx = bar_select_x + ((cell_size + tb_x_buffer)*ix*bar_scale);
	var bar_select_yy =  bar_select_y + ((cell_size)*iy*bar_scale);
	
	//Item
	iitem = inv_grid[ii].itemInSlot;
	if (iitem >= 0)
	{
		sx = (iitem mod spr_inv_items_columns)*cell_size;
		sy = (iitem div spr_inv_items_columns)*cell_size;
	}
	
	//Draw slot and item
	draw_sprite_part_ext(spr_inv_ui,0,0,0, cell_size, cell_size, xx, yy, bar_scale, bar_scale, c_white, 1);
	
	switch(ii) {
	
	case bar_selected_slot: 
			if (iitem > 0)
			{
				draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, bar_scale, bar_scale, c_white, 1);
			}
			
			draw_sprite_ext(spr_inventory_selected,0, bar_select_xx, bar_select_yy, bar_scale, bar_scale, 0, c_white, 1); //Selected sprite
	break;
	
	default:
			if (iitem > 0)
			{
				draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, bar_scale, bar_scale, c_white, 1);
			}
	break;
	}
	
	//Draw item number
	if (iitem > 0)
	{
		//draw_set_font(fnt_test);
		var number = inv_grid[ii].amount;
		draw_text_transformed_color(xx + (9*bar_scale), yy + (12*bar_scale), string(number), 0.2*bar_scale, 0.2*bar_scale, 0, c,c,c,c, 1);
	}
	
	//Increment
	ii += 1;
	ix = ii mod inv_slots_width;
	iy = ii div inv_slots_width;
	
}

#endregion

if (!show_inventory) exit;

var c = c_yellow
draw_set_font(fnt_smalldigits);

//draw_text_transformed_color(5, 10, "b1_mousey: " + string(testx), 0.115*scale, 0.115*scale, 0, c,c,c,c, 1);
/*
draw_text_color(10,170, "bar_selected_slot: " + string(bar_selected_slot), c,c,c,c, 1);
//draw_text_color(10,230, "testy: " + string(testy), c,c,c,c, 1);
draw_text_color(10,190, "mouse_in_chest: " + string(oChest.mouse_in_chest), c,c,c,c, 1);
draw_text_color(10,210, "inv buttons_selected: " + string(button), c,c,c,c, 1);
draw_text_color(10,230, "chest buttons_selected: " + string(oChest.button), c,c,c,c, 1);
*/
/*
for (var j = 0; j < INVENTORY_SLOTS; j++) {
	var ydist = 20
	draw_text_color(300,ydist*j + 80, string(inventory[j]) + "\n", c,c,c,c, 1);
}*/


draw_sprite_part_ext(
	spr_inv_ui, 0, cell_size, 0, inv_ui_width, inv_ui_height, 
	inv_ui_x, inv_ui_y, scale, scale, c_white, 1);
	
var sx = 0;
var sy = 0;
	
for (var i = 0; i < INVENTORY_SLOTS; i++) {
	
	var ix = i mod inv_slots_width;
	var iy = i div inv_slots_width;	
	var xx = slots_x + ((cell_size + x_buffer)*ix*scale);
	var yy =  slots_y + ((cell_size + y_buffer)*iy*scale);
	var controller_xx = slots_x + ((cell_size + x_buffer)*ix*scale);
	var controller_yy =  slots_y + ((cell_size + y_buffer)*iy*scale);
	var controller_sx = (oMouse.itemDrag mod spr_inv_items_columns)*cell_size;
	var	controller_sy = (oMouse.itemDrag div spr_inv_items_columns)*cell_size;	
	var select_xx = select_x + ((cell_size + x_buffer)*ix*scale);
	var select_yy =  select_y + ((cell_size + y_buffer)*iy*scale);
	
	var iitem = inventory[i].itemInSlot
	if (iitem > 0) {
		sx = (iitem mod spr_inv_items_columns)*cell_size;
		sy = (iitem div spr_inv_items_columns)*cell_size;	
	}
	
	//Draw slots and item
	draw_sprite_part_ext(spr_inv_ui,0,0,0, cell_size, cell_size, xx , yy, scale, scale, c_white, 1);
	
	switch(i) {
	
		case selected_slot: 
			if (iitem > 0) {
				draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);	
			}
			
			if (mouse_in_inventory) {	
				draw_sprite_ext(spr_inventory_selected,0, select_xx, select_yy, scale, scale, 0, c_white, 1); //Selected sprite
				
				if (oMouse.itemDrag != -1) {
					if (controller = 1) {
						draw_sprite_part_ext(spr_inv_items, 0, controller_sx, controller_sy, cell_size, cell_size, controller_xx+12, controller_yy+12, scale, scale, c_white, 0.7);
					}	
				}
			}
		break;
		
		default: 
			if (iitem > 0) {	
				draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);	
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

var button_xx = buttons_x ;
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
draw_set_font(fnt_test);

//Player info
draw_text_transformed_color(currency_x, name_y, string(name), 0.12*scale, 0.12*scale, 0, c,c,c,c, 1);
var c = #e8c170;
draw_text_transformed_color(currency_x, currency_y, string(currency), 0.12*scale, 0.12*scale, 0, c,c,c,c, 1);

if (oMouse.itemDrag != 0) {
	iitem = oMouse.itemDrag;
	sx = (iitem mod spr_inv_items_columns)*cell_size;
	sy = (iitem div spr_inv_items_columns)*cell_size;	
	draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, mousex, mousey, scale, scale, c_white, 0.7);
}