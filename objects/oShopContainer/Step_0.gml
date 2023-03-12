if (room == rm_creator) exit;
if (instance_exists(obj_cutscene)) exit;



if (!show_shop) exit;

mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);

var cell_xbuffer = (cell_size + x_buffer) * scale;
var cell_ybuffer = (cell_size + y_buffer) * scale;

var i_mousex = mousex - slots_x;
var i_mousey = mousey - slots_y;

var nx = i_mousex div cell_xbuffer;
var ny = i_mousey div cell_ybuffer;


mouse_in_shop = true;
if (nx >= 0 and nx < shop_slots_width and ny >= 0 and ny < shop_slots_height and i_mousey > 0 and i_mousex > 0)
{
	var sx = i_mousex - (nx*cell_xbuffer);
	var sy = i_mousey - (ny*cell_ybuffer);
	
	if ((sx < cell_size * scale) and (sy < cell_size * scale))
	{
		m_slotx = nx;
		m_sloty = ny;
	}
} else { mouse_in_shop = false;}


//Set Selected Slot to Mouse Position
selected_slot = min(shop_slots - 1, m_slotx + (m_sloty * shop_slots_width));