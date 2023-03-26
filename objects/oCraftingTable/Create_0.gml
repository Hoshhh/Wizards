ct_slots = 4
input_select = mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(0, gp_face1)
depth = -1;
scale = display_manager.window_scale;

cell_size = 16;
ct_slots_width = 4;
ct_slots_height = 1;
mouse_in_ct = false;

show_ct = false;

mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);

selected_slot = 0;
m_slotx = 0;
m_sloty = 0;

x_buffer = 3;
y_buffer = 3;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

ct_ui_width = 224;
ct_ui_height = 112;

spr_ct_ui = spr_alchemy_ui;
spr_ct_items = spr_inventory_items;

spr_ct_items_columns = sprite_get_width(spr_ct_items)/cell_size;
spr_ct_items_rows = sprite_get_height(spr_ct_items)/cell_size;


ct_ui_x = (gui_width * 0.5) - (ct_ui_width * 0.5 * scale);
ct_ui_y = (gui_height * 0.5) - (ct_ui_height * 0.5 * scale);


slots_x = ct_ui_x + (39 * scale);
slots_y = ct_ui_y + (46 * scale);

output_x = ct_ui_x + (57 * scale);
output_y = ct_ui_y + (16 * scale);

output_select_x = ct_ui_x + (55 * scale);
output_select_y = ct_ui_y + (14 * scale);

select_x = ct_ui_x + (36 * scale);
select_y = ct_ui_y + (44 * scale);

//Craft button location
craft_button_x = ct_ui_x + (52 * scale);
craft_button_y = ct_ui_y + (88 * scale);
craft_selected_x = ct_ui_x + (51 * scale);
craft_selected_y = ct_ui_y + (87 * scale);
craft_selected = false;
crafting = false;
crafting_timer = 0;

//Button locations that set the amount to craft
sub_button_x = ct_ui_x + (38 * scale);
sub_button_y = ct_ui_y + (71 * scale);
sub_selected_x = ct_ui_x + (37 * scale);
sub_selected_y = ct_ui_y + (70 * scale);
sub_selected = false;

add_button_x = ct_ui_x + (80 * scale);
add_button_y = ct_ui_y + (71 * scale);
add_selected_x = ct_ui_x + (79 * scale);
add_selected_y = ct_ui_y + (70 * scale);
add_selected = false;

//Displays the amount you want to craft
num_x = ct_ui_x + (64 * scale);
num_y = ct_ui_y + (72 * scale);
craft_num = 0;

//skill bar location
skillbar_x = ct_ui_x + (90 * scale);
skillbar_y = ct_ui_y + (15 * scale);

//Drawing position of the recipe
recipe_output_x = ct_ui_x + (132 * scale); 
recipe_item1_x = ct_ui_x + (160 * scale); 
recipe_item2_x = ct_ui_x + (179 * scale); 
recipe_item3_x = ct_ui_x + (198 * scale); 

recipe1_y = ct_ui_y + (12 * scale);
recipe2_y = ct_ui_y + (32 * scale);
recipe3_y = ct_ui_y + (52 * scale);
recipe4_y = ct_ui_y + (72 * scale);

prev_button_x = ct_ui_x + (145 * scale); 
prev_button_y = ct_ui_y + (97 * scale); 
prev_select_x = ct_ui_x + (144 * scale); 
prev_select_y = ct_ui_y + (96 * scale); 
prev_selected = false;

next_button_x = ct_ui_x + (193 * scale); 
next_button_y = ct_ui_y + (97 * scale);
next_select_x = ct_ui_x + (192 * scale); 
next_select_y = ct_ui_y + (96 * scale);
next_selected = false;


testx = -1;
testy = -1;

select = -1;
selected = false;
recipe_selected = -1;

recipe1_select_x = ct_ui_x + (131 * scale); 
recipe_select_y = ct_ui_y + (11 * scale); 


inventory = array_create(ct_slots, -1)

var yy = 0; repeat(ct_slots)
{
		inventory[yy] = {
			itemInSlot	: item.none,
			amount		: 0,
			iname		: "",
			quality		: 0
		}
		yy += 1;
}


recipe_page1 = array_create(2, -1)

recipe_page1[0] = {
	output_type	: item.smallshelf,
	output_amount	: 1,
	item1_type		: item.wood,
	item1_amount	: 20,
	item2_type		: item.none,
	item2_amount	: 0,
	item3_type		: item.none,
	item3_amount	: 0,
	unlocked		: true
}

recipe_page1[1] = {
	output_type	: item.furnace,
	output_amount	: 1,
	item1_type		: item.stone,
	item1_amount	: 20,
	item2_type		: item.none,
	item2_amount	: 0,
	item3_type		: item.none,
	item3_amount	: 0,
	unlocked		: true
}

recipe_page1[2] = {
	output_type	: item.LargeRedPotion,
	output_amount	: 1,
	item1_type		: item.centaury,
	item1_amount	: 8,
	item2_type		: item.PinkPotion,
	item2_amount	: 4,
	item3_type		: item.BluePotion,
	item3_amount	: 2,
	unlocked		: false
}

recipe_page1[3] = {
	output_type	: item.LargeBluePotion,
	output_amount	: 1,
	item1_type		: item.wolfsbane,
	item1_amount	: 8,
	item2_type		: item.YellowPotion,
	item2_amount	: 4,
	item3_type		: item.GreenPotion,
	item3_amount	: 2,
	unlocked		: false
}


recipe_page = recipe_page1;