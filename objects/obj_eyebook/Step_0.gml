timer++

if (timer >= 180) {
	var _chance = irandom_range(0, 100)	
	
	if (_chance >= 66) {
		image_speed = 1;	
	}
}

if (image_index >= 7) {
	image_index = 0;
	image_speed = 0;
	timer = 0;
}