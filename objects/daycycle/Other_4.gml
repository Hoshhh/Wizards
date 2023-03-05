switch(room)
{
	//Only add rooms that need day/night cycle
	case rm_test:			draw_daylight = true; break;
	case rm_testing:		draw_daylight = true; break;
	
	default:				draw_daylight = false; break;
}

if (surface_exists(surface)) {
	var _rw = room_width;
	var _rh = room_height;
	surface_resize(surface, _rw, _rh);
}