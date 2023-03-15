shop_slots = 6;
depth = -1;
scale = display_manager.window_scale*0.9;

obj = -1;

cell_size = 16;
shop_slots_width = 2;
shop_slots_height = 3;
mouse_in_shop = false;

mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);

show_shop = false;

selected_slot = 0;
m_slotx = 0;
m_sloty = 0;

x_buffer = 4;
y_buffer = 4;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

shop_ui_width = 87;
shop_ui_height = 87;

spr_ui = spr_shop_ui;
spr_shop_items = spr_inventory_items;

spr_shop_items_columns = sprite_get_width(spr_shop_items)/cell_size;
spr_shop_items_rows = sprite_get_height(spr_shop_items)/cell_size;

shop_ui_x = (gui_width * 0.85) - (shop_ui_width * 0.5 * scale);
shop_ui_y = (gui_height * 0.5) - (shop_ui_height * 0.5 * scale);

slots_x = shop_ui_x + (17 * scale);
slots_y = shop_ui_y + (15 * scale);

select_x = shop_ui_x + (15 * scale);
select_y = shop_ui_y + (13 * scale);

testx = -1;
testy = -1;

slot = 0;
total_stock = 0;
sellsPerHour = 10
new_array = array_create(shop_slots, -1)

inventory = array_create(shop_slots, -1)

var yy = 0; repeat(shop_slots)
{
		inventory[yy] = {
			itemInSlot	: item.none,
			amount		: 0,
			iname		: "",
			quality		: 0,
			obj			: noone,
			sell		: 0
		}
		yy += 1;
}
