furn_slots = 2;
depth = -1;
scale = display_manager.window_scale*0.9;

cell_size = 16;
furn_slots_width = 1;
furn_slots_height = 2;
mouse_in_furn = false;
mouse_in_output = false;

mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);

show_furn = false;
selected_slot = 0;
m_slotx = 0;
m_sloty = 0;

crafting_timer = 0;
crafted = false;

x_buffer = 1;
y_buffer = 9;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

furn_ui_width = 52;
furn_ui_height = 87;

spr_furn_ui = spr_furnace_ui;
spr_furn_items = spr_inventory_items;

spr_furn_items_columns = sprite_get_width(spr_furn_items)/cell_size;
spr_furn_items_rows = sprite_get_height(spr_furn_items)/cell_size;

furn_ui_x = (gui_width * 0.85) - (furn_ui_width * 0.5 * scale);
furn_ui_y = (gui_height * 0.5) - (furn_ui_height * 0.5 * scale);

slots_x = furn_ui_x + (18 * scale);
slots_y = furn_ui_y + (12 * scale);

select_x = furn_ui_x + (16 * scale);
select_y = furn_ui_y + (10 * scale);

output_x = furn_ui_x + (18 * scale);
output_y = furn_ui_y + (37 * scale);
output_select_x = furn_ui_x + (16 * scale);
output_select_y = furn_ui_y + (35 * scale);

testx = 0;
testy = 0;

inventory = array_create(furn_slots, -1)

var yy = 0; repeat(furn_slots)
{
		inventory[yy] = {
			itemInSlot	: item.none,
			amount		: 0,
			iname		: "",
			quality		: 0,
			obj			: noone
		}
		yy += 1;
}


ore_recipes = array_create(2, -1)
ore_recipes[0] = {
	output_type	: item.copperbar,
	output_amount	: 1,
	ore_type		: item.copperore,
	ore_amount		: 5,
	iname			: "Copper Bar",
	quality			: 1
}

ore_recipes[1] = {
	output_type	: item.ironbar,
	output_amount	: 1,
	ore_type		: item.ironore,
	ore_amount		: 5,
	iname			: "Iron Bar",
	quality			: 1
}

ore_recipes[2] = {
	output_type	: item.goldbar,
	output_amount	: 1,
	ore_type		: item.goldore,
	ore_amount		: 5,
	iname			: "Gold Bar",
	quality			: 1
}