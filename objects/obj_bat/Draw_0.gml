event_inherited();

if (flash > 0 ) {
	flash--;
	shader_set(sh_white)
	draw_self();
	shader_reset();
}
