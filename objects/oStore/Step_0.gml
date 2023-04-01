if (!show_store) exit;

mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);

#region Recipe selectors

//Selecting an item from the store
var item_mousex = mousex - item_x;
var item1_mousey = mousey - item1_y;
var item2_mousey = mousey - item2_y;
var item3_mousey = mousey - item3_y;
var item4_mousey = mousey - item4_y;

testx = item_mousex;
testy = item2_mousey;


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
	
#endregion