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
} else if ((sub_mousex >= 0 and sub_mousex <= 10*scale) and (sub2_mousey >= 0 and sub2_mousey <= 9*scale)) {
	sub_select = 1;
} else if ((sub_mousex >= 0 and sub_mousex <= 10*scale) and (sub3_mousey >= 0 and sub3_mousey <= 9*scale)) {
	sub_select = 2;
} else if ((sub_mousex >= 0 and sub_mousex <= 10*scale) and (sub4_mousey >= 0 and sub4_mousey <= 9*scale)) {
	sub_select = 3;
} else {
	sub_select = -1;	
}

testx = sub_mousex;
testy = sub1_mousey;
	
#endregion