event_inherited();

if (selected) {
	image_alpha = 0.8
} else {
	image_alpha = 1;	
}

if (show_selected) {
	image_alpha = 0.8
} 

if (!selected and !show_selected) {
	image_alpha = 1;	
}

//draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true)
//draw_text(x, y-8, string(hp))