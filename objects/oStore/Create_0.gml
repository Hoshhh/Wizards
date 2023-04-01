depth = -1;
scale = display_manager.window_scale;

cell_size = 16;
show_store = true;

mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);

selected_slot = 0;
m_slotx = 0;
m_sloty = 0;

x_buffer = 0;
y_buffer = 2;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

store_ui_width = 160;
store_ui_height = 112;

spr_ui = spr_store_ui;
spr_store_items = spr_inventory_items;

spr_store_items_columns = sprite_get_width(spr_store_items)/cell_size;
spr_store_items_rows = sprite_get_height(spr_store_items)/cell_size;

store_ui_x = (gui_width * 0.5) - (store_ui_width * 0.5 * scale);
store_ui_y = (gui_height * 0.5) - (store_ui_height * 0.5 * scale);

//Drawing position of the purchased item
item_x = store_ui_x + (16 * scale); 
item1_y = store_ui_y + (16 * scale);
item2_y = store_ui_y + (34 * scale);
item3_y = store_ui_y + (52 * scale);
item4_y = store_ui_y + (70 * scale);

item_select_x = store_ui_x + (15 * scale); 
item_select_y = store_ui_y + (15 * scale);

//Position for item name text
item_name_x = store_ui_x + (34 * scale); 
item1_name_y = store_ui_y + (22 * scale); 
item2_name_y = store_ui_y + (22 * scale); 
item3_name_y = store_ui_y + (22 * scale); 
item4_name_y = store_ui_y + (22 * scale); 

//Position for item stock amount
item_stock_x = store_ui_x + (99 * scale); 
item_stock_y = store_ui_y + (22 * scale); 

//Button locations that set the amount to craft
sub_button_x = store_ui_x + (115 * scale);
sub_button_y = store_ui_y + (119 * scale);
sub_selected_x = store_ui_x + (114 * scale);
sub_selected_y = store_ui_y + (118 * scale);
sub_selected = false;

add_button_x = store_ui_x + (142 * scale);
add_button_y = store_ui_y + (119 * scale);
add_selected_x = store_ui_x + (141 * scale);
add_selected_y = store_ui_y + (118 * scale);
add_selected = false;
height_buffer = 19

//Purchase button coords
purchase_button_x = store_ui_x + (66 * scale);
purchase_button_y = store_ui_y + (91 * scale);
purchase_selected_x = store_ui_x + (65 * scale);
purchase_selected_y = store_ui_y + (90 * scale);
purchase_selected = false;

//Position for amount to purchase
num_x = store_ui_x + (130 * scale);
num_y = store_ui_y + (22 * scale);
item1_num = 0;
item2_num = 0;
item3_num = 0;
item4_num = 0;

testx = -1;
testy = -1;

select = 0;

stock_page1 = array_create(4, -1)

stock_page1[0] = {
	item_type		: item.centauryseeds,
	item_name		: "Centaury Seeds",
	item_amount		: 25,
	item_price		: 15
}

stock_page1[1] = {
	item_type		: item.wolfsbaneseeds,
	item_name		: "Wolfsbane Seeds",
	item_amount		: 25,
	item_price		: 20
}

stock_page1[2] = {
	item_type		: item.wood,
	item_name		: "Wood",
	item_amount		: 65,
	item_price		: 5
}

stock_page1[3] = {
	item_type		: item.stone,
	item_name		: "Stone",
	item_amount		: 65,
	item_price		: 5
}


stock_page = stock_page1;