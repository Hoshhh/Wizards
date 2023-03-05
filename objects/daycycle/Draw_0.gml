if (room = rm_creator) exit;

if (draw_daylight)

{
	var _rw = room_width;
	var _rh = room_height;
	
	if (!surface_exists(surface))
	{
		surface = surface_create(_rw, _rh);
	}


	var c = light_color;
	draw_set_alpha(darkness);
	surface_set_target(surface);
	depth = -10
	draw_rectangle_color(0, 0, _rw, _rh, c,c,c,c, false);

/*
	if (hours > 20 or hours <= phase.sunrise)
	{
		with(obj_lantern)
		{
			gpu_set_blendmode(bm_src_color);
			draw_sprite_ext(spr_glow, 0, x, y, glowSize, glowSize, 0, c_white, 1);
			gpu_set_blendmode(bm_normal);
		}
	}*/

	surface_reset_target();
	draw_surface(surface, 0, 0);
	draw_set_alpha(1);

}