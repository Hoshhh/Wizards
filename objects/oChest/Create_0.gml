#macro CHEST_SLOTS 20
input_select = mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(0, gp_face1)
depth = -1;
scale = display_manager.window_scale*0.9;

cell_size = 16;
chest_slots_width = 5;
chest_slots_height = 4;
mouse_in_chest = false;

show_chest = false;
controller = 0;
chest_selected = true;
buttons_selected = false;

mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);

selected_slot = 0;
m_slotx = 0;
m_sloty = 0;

x_buffer = 3;
y_buffer = 3;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

chest_ui_width = 142;
chest_ui_height = 87;

spr_ch_ui = spr_chest_ui;
spr_chest_items = spr_inventory_items;

spr_chest_items_columns = sprite_get_width(spr_chest_items)/cell_size;
spr_chest_items_rows = sprite_get_height(spr_chest_items)/cell_size;

chest_ui_x = (gui_width * 0.80) - (chest_ui_width * 0.5 * scale);
chest_ui_y = (gui_height * 0.5) - (chest_ui_height * 0.5 * scale);

info_x = chest_ui_x;
info_y = chest_ui_y + (57 * scale);

slots_x = chest_ui_x + (7 * scale);
slots_y = chest_ui_y + (7 * scale);

select_x = chest_ui_x + (5 * scale);
select_y = chest_ui_y + (5 * scale);

buttons_x = chest_ui_x + (106 * scale);
buttons_y = chest_ui_y + (2 * scale);

//Drawing position based on "centered" alignment
draw_button_x = chest_ui_x + (114 * scale); 
draw_button1_y = chest_ui_y + (8 * scale);
draw_button2_y = chest_ui_y + (18 * scale);
draw_button3_y = chest_ui_y + (28 * scale);

//Gui position for the top left x,y values for the buttons
button_x = chest_ui_x + (108 * scale);
button1_y = chest_ui_y + (7 * scale);
button2_y = chest_ui_y + (17 * scale);
button3_y = chest_ui_y + (27 * scale);

button = -1;

inventory = array_create(CHEST_SLOTS, -1)


var yy = 0; repeat(CHEST_SLOTS)
{
		inventory[yy] = {
			itemInSlot	: item.none,
			amount		: 0,
			iname		: "",
			quality		: 0
		}
		yy += 1;
}