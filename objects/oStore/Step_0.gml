if (!show_store) exit;

mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);

#region Selectors math

//Selecting an item from the store
var item_mousex = mousex - item_x;
var item1_mousey = mousey - item1_y;
var item2_mousey = mousey - item2_y;
var item3_mousey = mousey - item3_y;
var item4_mousey = mousey - item4_y;


if ((item_mousex >= 0 and item_mousex <= 95*scale) and (item1_mousey >= 0 and item1_mousey <= 15*scale)) {
	select = 0;
} else if ((item_mousex >= 0 and item_mousex <= 95*scale) and (item2_mousey >= 0 and item2_mousey <= 15*scale)) {
	select = 1;
} else if ((item_mousex >= 0 and item_mousex <= 95*scale) and (item3_mousey >= 0 and item3_mousey <= 15*scale)) {
	select = 2;
} else if ((item_mousex >= 0 and item_mousex <= 95*scale) and (item4_mousey >= 0 and item4_mousey <= 15*scale)) {
	select = 3;
} else {
	select = -1;	
}


var add_mousex = mousex - add_button_x;
var add1_mousey = mousey - add1_button_y
var add2_mousey = mousey - add2_button_y
var add3_mousey = mousey - add3_button_y
var add4_mousey = mousey - add4_button_y

if ((add_mousex >= 0 and add_mousex <= 10*scale) and (add1_mousey >= 0 and add1_mousey <= 9*scale)) {
	add_select = 0;
} else if ((add_mousex >= 0 and add_mousex <= 10*scale) and (add2_mousey >= 0 and add2_mousey <= 9*scale)) {
	add_select = 1;
} else if ((add_mousex >= 0 and add_mousex <= 10*scale) and (add3_mousey >= 0 and add3_mousey <= 9*scale)) {
	add_select = 2;
} else if ((add_mousex >= 0 and add_mousex <= 10*scale) and (add4_mousey >= 0 and add4_mousey <= 9*scale)) {
	add_select = 3;
} else {
	add_select = -1;	
}

var sub_mousex = mousex - sub_button_x;
var sub1_mousey = mousey - sub1_button_y
var sub2_mousey = mousey - sub2_button_y
var sub3_mousey = mousey - sub3_button_y
var sub4_mousey = mousey - sub4_button_y

if ((sub_mousex >= 0 and sub_mousex <= 10*scale) and (sub1_mousey >= 0 and sub1_mousey <= 9*scale)) {
	sub_select = 0;
	if (sub_select == 0 and mouse_check_button_pressed(mb_left) and item1_num > 0) {
		item1_num--;
	}
} else if ((sub_mousex >= 0 and sub_mousex <= 10*scale) and (sub2_mousey >= 0 and sub2_mousey <= 9*scale)) {
	sub_select = 1;
	if (sub_select == 1 and mouse_check_button_pressed(mb_left) and item2_num > 0) {
		item2_num--;
	}
} else if ((sub_mousex >= 0 and sub_mousex <= 10*scale) and (sub3_mousey >= 0 and sub3_mousey <= 9*scale)) {
	sub_select = 2;
	if (sub_select == 2 and mouse_check_button_pressed(mb_left) and item3_num > 0) {
		item3_num--;
	}
} else if ((sub_mousex >= 0 and sub_mousex <= 10*scale) and (sub4_mousey >= 0 and sub4_mousey <= 9*scale)) {
	sub_select = 3;
	if (sub_select == 3 and mouse_check_button_pressed(mb_left) and item4_num > 0) {
		item4_num--;
	}
} else {
	sub_select = -1;	
}

//testx = sub_mousex;
//testy = sub1_mousey;
	
#endregion


var _total = (item1_num * stock_page[0].item_price) + (item2_num * stock_page[1].item_price) + (item3_num * stock_page[2].item_price) + (item4_num * stock_page[3].item_price)

if (_total <= oInventory.currency) {
	var _items = array_create(4,0);
	var spots_needed = 0;
	#region Add purchase amounts
	if (add_select == 0 and mouse_check_button_pressed(mb_left)) {
		var empty = InventorySearch(oInventory, item.none)
		if (empty > -1 and item1_num <= stock_page[add_select].item_amount) {
			item1_num++;
		}
	}
	
	if (add_select == 1 and mouse_check_button_pressed(mb_left)) {
		var empty = InventorySearch(oInventory, item.none)
		if (empty > -1 and item3_num <= stock_page[add_select].item_amount) {
			item2_num++;
		}
	}

	if (add_select == 2 and mouse_check_button_pressed(mb_left)) {
		var empty = InventorySearch(oInventory, item.none)
		if (empty > -1 and item3_num <= stock_page[add_select].item_amount) {
			item3_num++;
		}
	}
	
	if (add_select == 3 and mouse_check_button_pressed(mb_left)) {
		var empty = InventorySearch(oInventory, item.none)
		if (empty > -1 and item3_num <= stock_page[add_select].item_amount) {
			item4_num++;
		}
	}
	#endregion
	
	#region check for how many different items the player is attempting to purchase
	
	if ( item1_num > 0) { _total[0] = 1; } else { _total[0] = 0; }
	if ( item2_num > 0) { _total[1] = 1; } else { _total[1] = 0; }
	if ( item3_num > 0) { _total[2] = 1; } else { _total[2] = 0; }
	if ( item4_num > 0) { _total[3] = 1; } else { _total[3] = 0; }
	
	for (var i = 0; i < array_length(_total); i++) {
		if (_total[i] == 1) {
			spots_needed += 1;	
			testx = spots_needed;
		}
	}
	
	#endregion
}