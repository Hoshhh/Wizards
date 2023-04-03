INVENTORY_SLOTS  = 15;
depth = -1;
scale = 1;

cell_size = 16;
inv_slots_width = 5;
inv_slots_height = 4;
mouse_in_inventory = false;

mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);

show_inventory = false;
inv_selected = true;
controller = 0;
buttons_selected = false;

selected_slot = 0;
m_slotx = 0;
m_sloty = 0;

x_buffer = 3;
y_buffer = 3;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

inv_ui_width = 191;
inv_ui_height = 87;

spr_inv_ui = spr_inventory_ui;
spr_inv_items = spr_inventory_items;

spr_inv_items_columns = sprite_get_width(spr_inv_items)/cell_size;
spr_inv_items_rows = sprite_get_height(spr_inv_items)/cell_size;

inv_ui_x = (gui_width * 0.5) - (inv_ui_width * 0.5 * scale);
inv_ui_y = (gui_height * 0.5) - (inv_ui_height * 0.5 * scale);

slots_x = inv_ui_x + (55 * scale);
slots_y = inv_ui_y + (7 * scale);

select_x = inv_ui_x + (53 * scale);
select_y = inv_ui_y + (5 * scale);

buttons_x = inv_ui_x + (155 * scale);
buttons_y = inv_ui_y + (2 * scale);

//Drawing position based on "centered" alignment
draw_button_x = inv_ui_x + (163 * scale); 
draw_button1_y = inv_ui_y + (8 * scale);
draw_button2_y = inv_ui_y + (18 * scale);
draw_button3_y = inv_ui_y + (28 * scale);

//Gui position for the top left x,y values for the buttons
button_x = inv_ui_x + (157 * scale);
button1_y = inv_ui_y + (7 * scale);
button2_y = inv_ui_y + (17 * scale);
button3_y = inv_ui_y + (27 * scale);

//Gui position for player info (currency/name)
name_x = inv_ui_x + (6 * scale);
name_y = inv_ui_y + (66 * scale);

currency_x = inv_ui_x + (6 * scale);
currency_y = inv_ui_y + (76 * scale);

button = -1;

test = -1;
testx = -1;
testy = -1;

currency = 1000;
name = ""

//-------Items

enum item {
	none					= -1,
	QuestionMark			= 1,
	RedPotion				= 2,
	YellowPotion			= 3,
	BluePotion				= 4,
	OrangePotion			= 5,
	GreenPotion				= 6,
	PurplePotion			= 7,
	NavyPotion				= 8,
	PinkPotion				= 9,
	BlackPotion				= 10,
	DarkGreenPotion			= 11,
	DarkRedPotion			= 12,
	LargeRedPotion			= 13,
	LargeYellowPotion		= 14,
	LargeBluePotion			= 15,
	LargeOrangePotion		= 16,
	LargeGreenPotion		= 17,
	LargePurplePotion		= 18,
	LargeNavyPotion			= 19,
	LargePinkPotion			= 20,
	LargeBlackPotion		= 21,
	LargeDarkGreenPotion	= 22,
	LargeDarkRedPotion		= 23,
	centaury				= 24,
	wolfsbane				= 25,
	centauryseeds			= 26,
	wolfsbaneseeds			= 27,
	purplemushroom			= 28,
	yellowmushroom			= 29,
	orangemushroom			= 30,
	lightgreenmushroom		= 31,
	cyanmushroom			= 32,
	greymushroom			= 33,
	whitemushroom			= 34,
	pinkmushroom			= 35,
	redmushroom				= 36,
	brownmushroom			= 37,
	palemushroom			= 38,
	greenmushroom			= 39,
	bluemushroom			= 40,
	blueberry				= 41,
	greenberry				= 42,
	purpleberry				= 43,
	redberry				= 44,
	chest					= 45,
	furnace					= 46,
	wood					= 47,
	stone					= 48,
	copperore				= 49,
	copperbar				= 50,
	ironore					= 51,
	ironbar					= 52,
	goldore					= 53,
	goldbar					= 54,
	smallshelf				= 55,
	largeshelf				= 56,
	craftingtable			= 57,
	height					= 58,
}

#region Item Info Array

item_info = array_create(item.height)
item_info[0] = {
	iname : "Nothing",
	quality : 0,
	obj : noone,
	sell : 0
}

item_info[1] = {
	iname : "Unknown",
	quality : 0,
	obj : noone,
	sell : 0
}

item_info[2] = {
	iname : "Red Potion",
	quality : 1,
	obj : noone,
	sell : 100
}

item_info[3] = {
	iname : "Yellow Potion",
	quality : 1,
	obj : noone,
	sell : 100
}

item_info[4] = {
	iname : "Blue Potion",
	quality : 1,
	obj : noone,
	sell : 100
}

item_info[5] = {
	iname : "Orange Potion",
	quality : 1,
	obj : noone,
	sell : 100
}

item_info[6] = {
	iname : "Green Potion",
	quality : 1,
	obj : noone,
	sell : 100
}

item_info[7] = {
	iname : "Purple Potion",
	quality : 1,
	obj : noone,
	sell : 100
}

item_info[8] = {
	iname : "Navy Potion",
	quality : 1,
	obj : noone,
	sell : 100
}

item_info[9] = {
	iname : "Pink Potion",
	quality : 1,
	obj : noone,
	sell : 100
}

item_info[10] = {
	iname : "Black Potion",
	quality : 1,
	obj : noone,
	sell : 100
}

item_info[11] = {
	iname : "Dark Green Potion",
	quality : 1,
	obj : noone,
	sell : 100
}

item_info[12] = {
	iname : "Dark Red Potion",
	quality : 1,
	obj : noone,
	sell : 100
}

item_info[13] = {
	iname : "Large Red Potion",
	quality : 2,
	obj : noone,
	sell : 100
}

item_info[14] = {
	iname : "Large Yellow Potion",
	quality : 2,
	obj : noone,
	sell : 100
}

item_info[15] = {
	iname : "Large Blue Potion",
	quality : 2,
	obj : noone,
	sell : 100
}

item_info[16] = {
	iname : "Large Orange Potion",
	quality : 2,
	obj : noone,
	sell : 100
}

item_info[17] = {
	iname : "Large Green Potion",
	quality : 2,
	obj : noone,
	sell : 100
}

item_info[18] = {
	iname : "Large Purple Potion",
	quality : 2,
	obj : noone,
	sell : 100
}

item_info[19] = {
	iname : "Large Navy Potion",
	quality : 2,
	obj : noone,
	sell : 100
}

item_info[20] = {
	iname : "Large Pink Potion",
	quality : 2,
	obj : noone,
	sell : 100
}

item_info[21] = {
	iname : "Large Black Potion",
	quality : 2,
	obj : noone,
	sell : 100
}

item_info[22] = {
	iname : "Large Dark Green Potion",
	quality : 2,
	obj : noone,
	sell : 100
}

item_info[23] = {
	iname : "Large Dark Red Potion",
	quality : 2,
	obj : noone,
	sell : 100
}

item_info[24] = {
	iname : "Centaury",
	quality : 1,
	obj : noone,
	sell : 0
}

item_info[25] = {
	iname : "Wolfsbane",
	quality : 1,
	obj : noone,
	sell : 0
}

item_info[26] = {
	iname : "Centaury Seeds",
	quality : 1,
	obj : noone,
	sell : 0
}

item_info[27] = {
	iname : "Wolfsbane Seeds",
	quality : 1,
	obj : noone,
	sell : 0
}

item_info[28] = {
	iname : "Purple Mushroom",
	quality : 1,
	obj : noone,
	sell : 0
}

item_info[29] = {
	iname : "Yellow Mushroom",
	quality : 1,
	obj : noone,
	sell : 0
}

item_info[30] = {
	iname : "Orange Mushroom",
	quality : 1,
	obj : noone,
	sell : 0
}

item_info[31] = {
	iname : "Light Green Mushroom",
	quality : 1,
	obj : noone,
	sell : 0
}

item_info[32] = {
	iname : "Cyan Mushroom",
	quality : 1,
	obj : noone,
	sell : 0
}

item_info[33] = {
	iname : "Grey Mushroom",
	quality : 1,
	obj : noone,
	sell : 0
}

item_info[34] = {
	iname : "White Mushroom",
	quality : 1,
	obj : noone,
	sell : 0
}

item_info[35] = {
	iname : "Pink Mushroom",
	quality : 1,
	obj : noone,
	sell : 0
}

item_info[36] = {
	iname : "Red Mushroom",
	quality : 1,
	obj : noone,
	sell : 0
}

item_info[37] = {
	iname : "Brown Mushroom",
	quality : 1,
	obj : noone,
	sell : 0
}

item_info[38] = {
	iname : "Pale Mushroom",
	quality : 1,
	obj : noone,
	sell : 0
}

item_info[39] = {
	iname : "Green Mushroom",
	quality : 1,
	obj : noone,
	sell : 0
}

item_info[40] = {
	iname : "Blue Mushroom",
	quality : 1,
	obj : noone,
	sell : 0
}

item_info[41] = {
	iname : "Blue Berry",
	quality : 1,
	obj : noone,
	sell : 0
}

item_info[42] = {
	iname : "Green Berry",
	quality : 1,
	obj : noone,
	sell : 0
}

item_info[43] = {
	iname : "Purple Berry",
	quality : 1,
	obj : noone,
	sell : 0
}

item_info[44] = {
	iname : "Red Berry",
	quality : 1,
	obj : noone,
	sell : 0
}

item_info[45] = {
	iname : "Chest",
	quality : 1,
	obj	: oChest,
	sell : 0
}

item_info[46] = {
	iname : "Furnace",
	quality : 1,
	obj : oFurnace,
	sell : 0
}

item_info[47] = {
	iname : "Wood",
	quality : 1,
	obj : noone,
	sell : 0
}

item_info[48] = {
	iname : "Stone",
	quality : 1,
	obj : noone,
	sell : 0
}

item_info[49] = {
	iname : "Copper Ore",
	quality : 1,
	obj : noone,
	sell : 0
}

item_info[50] = {
	iname : "Copper Bar",
	quality : 1,
	obj : noone,
	sell : 0
}

item_info[51] = {
	iname : "Iron Ore",
	quality : 1,
	obj : noone,
	sell : 0
}

item_info[52] = {
	iname : "Iron Bar",
	quality : 1,
	obj : noone,
	sell : 0
}

item_info[53] = {
	iname : "Gold Ore",
	quality : 1,
	obj : noone,
	sell : 0
}

item_info[54] = {
	iname : "Gold Bar",
	quality : 1,
	obj : noone,
	sell : 0
}

item_info[55] = {
	iname : "Small Shelf",
	quality : 1,
	obj : oShopContainer,
	sell : 0
}

item_info[56] = {
	iname : "Large Shelf",
	quality : 1,
	obj : oShopContainer,
	sell : 0
}

item_info[57] = {
	iname : "Crafting Table",
	quality : 1,
	obj : oCraftingTable,
	sell : 0
}

#endregion

inventory = array_create(INVENTORY_SLOTS, -1)

inventory[0] = {
	itemInSlot	: item.smallshelf,
	amount		: 10,
	iname		: "Small Cabinet",
	quality		: 1,
	obj			: oShopContainer,
	sell		: 0
}

inventory[1] = {
	itemInSlot	: item.craftingtable,
	amount		: 1,
	iname		: "Crafting Table",
	quality		: 1,
	obj			: oCraftingTable,
	sell		: 0
}


inventory[2] = {
	itemInSlot	: item.furnace,
	amount		: 10,
	iname		: "Furnace",
	quality		: 1,
	obj			: oFurnace,
	sell		: 0
}

inventory[3] = {
	itemInSlot	: item.chest,
	amount		: 10,
	iname		: "Chest",
	quality		: 1,
	obj			: oChest,
	sell		: 0
}

inventory[4] = {
	itemInSlot	: item.BluePotion,
	amount		: 112,
	iname		: "Blue Potion",
	quality		: 1,
	obj			: noone,
	sell		: 100
}

inventory[5] = {
	itemInSlot	: item.RedPotion,
	amount		: 122,
	iname		: "Red Potion",
	quality		: 1,
	obj			: noone,
	sell		: 100
}


var yy = 6; repeat(INVENTORY_SLOTS)
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

//Hotbar
#region Toolbar
bar_scale = 1;
show_toolbar = true;
mouse_in_toolbar = false;

bar_slots = 5;

bar_selected_slot = 0;
bar_selected_prev = 0;

tb_x_buffer = 5;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

bar_ui_width = 108;
bar_ui_height = 24;

spr_bar_ui = spr_inventory_toolbar;

bar_ui_x = (gui_width * 0.5) - (bar_ui_width * 0.5 * bar_scale);
bar_ui_y = (gui_height * 0.9) - (bar_ui_height * 0.3 * bar_scale);


bar_slots_x = bar_ui_x + (4 * bar_scale);
bar_slots_y = bar_ui_y + (4 * bar_scale);

bar_select_x = bar_ui_x + (2 * bar_scale);
bar_select_y = bar_ui_y + (2 * bar_scale);


#endregion