debug = false;


gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

blackAlpha = 0;
spawnRoom = -1;
doTransition = false;

spawnX = 0;
spawnY = 0;
spawnPlayerFacing = -1;

roomWidth = room_width;
roomHeight = room_height;

enum dir 
{
	right = 0,
	up = 90,
	left = 180,
	down = 270,
}


//variables
global.coloring = {
	skin: {
		//Lighter Tan
		v_threshhold:	[0.112, 0.31, 0.443, 0.625, 0.808],
		v_red:			[(24/255), (173/255), (192/255), (215/255), (231/255)],
		v_green:		[(20/255), (119/255), (148/255), (181/255), (213/255)],
		v_blue:			[(37/255), (87/255), (115/255), (148/255), (179/255)],
	},
	hat: {
		//Blue
		v_threshhold:	[0.112, 0.31, 0.443, 0.625, 0.808],
		v_red:			[(24/255), (37/255), (60/255), (79/255), (115/255)],
		v_green:		[(20/255), (58/255), (94/255), (143/255), (190/255)],
		v_blue:			[(37/255), (94/255), (139/255), (186/255), (211/255)],
	},
	body: {
		//Blue
		v_threshhold:	[0.112, 0.31, 0.443, 0.625, 0.808],
		v_red:			[(24/255), (37/255), (60/255), (79/255), (115/255)],
		v_green:		[(20/255), (58/255), (94/255), (143/255), (190/255)],
		v_blue:			[(37/255), (94/255), (139/255), (186/255), (211/255)],
	},
	staff: {
		//Lightest Brown
		v_threshhold:	[0.112, 0.31, 0.443, 0.625, 0.808],
		v_red:			[(24/255), (77/255), (122/255), (173/255), (192/255)],
		v_green:		[(20/255), (43/255), (72/255), (119/255), (148/255)],
		v_blue:			[(37/255), (50/255), (65/255), (87/255), (115/255)],
	}
}