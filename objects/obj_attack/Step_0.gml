if (instance_exists(enemy)) {
	if (instance_exists(target)) {
		move_towards_point(target.x, target.y, 4);
		image_angle = point_direction(x,y, target.x, target.y);
	}
}
