var c = c_yellow
draw_set_font(fnt_smalldigits);

if (!show_store) exit;

draw_text_color(10,5, "mx: " + string(testx), c,c,c,c, 1);
draw_text_color(10,15, "my: " + string(testy), c,c,c,c, 1);

draw_sprite_part_ext(
	spr_ui, 0, 0, 0, store_ui_width, store_ui_height, 
	store_ui_x, store_ui_y, scale, scale, c_white, 1);
	

var item_select_xx = item_select_x;
var item_select_yy = item_select_y + (18*select*scale);
var add_select_xx = add_select_x;
var add_select_yy = add_select_y + (18*add_select*scale);
var sub_select_xx = sub_select_x;
var sub_select_yy = sub_select_y + (18*sub_select*scale);

if (select >= 0) {
	draw_sprite_ext(spr_select_item,0, item_select_xx, item_select_yy, scale, scale, 0, c_white, 1);
}

if (add_select >= 0) {
	draw_sprite_ext(spr_select_small,0, add_select_xx, add_select_yy, scale, scale, 0, c_white, 1);
}

if (sub_select >= 0) {
	draw_sprite_ext(spr_select_small,0, sub_select_xx, sub_select_yy, scale, scale, 0, c_white, 1);
}


//For the items per page
for (var i = 0; i < array_length(stock_page); i++) {
	var stock_item_sx = 0;
	var stock_item_sy = 0;

	var _item = stock_page[i].item_type;
	var iname = stock_page[i].item_name;
	var amount = stock_page[i].item_amount;
	var price = stock_page[i].item_price;
	
	#region setting x and y positions of the which sprite to show
	if (_item > 0) {
		stock_item_sx = (_item mod spr_store_items_columns)*cell_size;
		stock_item_sy = (_item div spr_store_items_columns)*cell_size;	
	}
	#endregion
	
	#region Drawing shop information
	
	if (i = 0) {
		var c = c_white;
		draw_text_transformed_color(item_name_x, item1_name_y, string(iname), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
		draw_text_transformed_color(item_stock_x, item1_stock_y, string(amount), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
		draw_text_transformed_color(num_x, num1_y, string(item1_num), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
		draw_sprite_part_ext(spr_store_items, 0, stock_item_sx, stock_item_sy, cell_size, cell_size, item_x, item1_y, scale, scale, c_white, 1);	
	}
	
	if (i = 1) {
		var c = c_white;
		draw_text_transformed_color(item_name_x, item2_name_y, string(iname), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
		draw_text_transformed_color(item_stock_x, item2_stock_y, string(amount), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
		draw_text_transformed_color(num_x, num2_y, string(item2_num), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
		draw_sprite_part_ext(spr_store_items, 0, stock_item_sx, stock_item_sy, cell_size, cell_size, item_x, item2_y, scale, scale, c_white, 1);	
	}
	
	if (i = 2) {
		var c = c_white;
		draw_text_transformed_color(item_name_x, item3_name_y, string(iname), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
		draw_text_transformed_color(item_stock_x, item3_stock_y, string(amount), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
		draw_text_transformed_color(num_x, num3_y, string(item3_num), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
		draw_sprite_part_ext(spr_store_items, 0, stock_item_sx, stock_item_sy, cell_size, cell_size, item_x, item3_y, scale, scale, c_white, 1);	
	}
	
	if (i = 3) {
		var c = c_white;
		draw_text_transformed_color(item_name_x, item4_name_y, string(iname), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
		draw_text_transformed_color(item_stock_x, item4_stock_y, string(amount), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
		draw_text_transformed_color(num_x, num4_y, string(item4_num), 0.2*scale, 0.2*scale, 0, c,c,c,c, 1);
		draw_sprite_part_ext(spr_store_items, 0, stock_item_sx, stock_item_sy, cell_size, cell_size, item_x, item4_y, scale, scale, c_white, 1);	
	}
	
	#endregion
	
}