if (spr == spr_spell_harvest) {
	anim_len = 30;	
	anim_spd = 16;
} else if (idleTimer <= 0) { 
	spr = spr_longidle;
	anim_len = 34
		
	if (x_frame >= 33) {
		spr = spr_idle;	
		idleTimer = 600;
		anim_len = 6;
	}
} else {
	anim_len = 6;
	anim_spd = 12;	
}

//Increment frame for animation
x_frame += anim_spd/60;
if(x_frame >= anim_len) x_frame = 0;

//draw_text(x,y+16, string(x_frame))
//draw_text(x,y+32, string(spr))


if (flip == 1) {
	//Arm Staff
	with_shader(sh_Colorize, function() {
		var y_frame = 1;
		var xx = x-x_offset;
		var yy = y-y_offset;
	
		shader_set_uniform_f_array(in_threshold, global.coloring.staff.v_threshhold);
		shader_set_uniform_f_array(in_red, global.coloring.staff.v_red);
		shader_set_uniform_f_array(in_green, global.coloring.staff.v_green);
		shader_set_uniform_f_array(in_blue, global.coloring.staff.v_blue);

		draw_sprite_part_ext(spr, 0, floor(x_frame)*frame_size, y_frame, frame_size, frame_size, xx,yy,scale,scale,c_white,1);
	})



	//Body
	with_shader(sh_Colorize, function() {
		var y_frame = 32;
		var xx = x-x_offset;
		var yy = y-y_offset;
	
		shader_set_uniform_f_array(in_threshold, global.coloring.body.v_threshhold);
		shader_set_uniform_f_array(in_red, global.coloring.body.v_red);
		shader_set_uniform_f_array(in_green, global.coloring.body.v_green);
		shader_set_uniform_f_array(in_blue, global.coloring.body.v_blue);

		draw_sprite_part_ext(spr, 0, floor(x_frame)*frame_size, y_frame, frame_size, frame_size, xx,yy,scale,scale,c_white,1);
	})


	//Head
	with_shader(sh_Colorize, function() {
		var y_frame = 64;
		var xx = x-x_offset;
		var yy = y-y_offset;
	
		shader_set_uniform_f_array(in_threshold, global.coloring.skin.v_threshhold);
		shader_set_uniform_f_array(in_red, global.coloring.skin.v_red);
		shader_set_uniform_f_array(in_green, global.coloring.skin.v_green);
		shader_set_uniform_f_array(in_blue, global.coloring.skin.v_blue);

		draw_sprite_part_ext(spr, 0, floor(x_frame)*frame_size, y_frame, frame_size, frame_size, xx,yy,scale,scale,c_white,1);
	})


	//Back Arm
	with_shader(sh_Colorize, function() {
		var y_frame = 96;
		var xx = x-x_offset;
		var yy = y-y_offset;
	
		shader_set_uniform_f_array(in_threshold, global.coloring.skin.v_threshhold);
		shader_set_uniform_f_array(in_red, global.coloring.skin.v_red);
		shader_set_uniform_f_array(in_green, global.coloring.skin.v_green);
		shader_set_uniform_f_array(in_blue, global.coloring.skin.v_blue);

		draw_sprite_part_ext(spr, 0, floor(x_frame)*frame_size, y_frame, frame_size, frame_size, xx,yy,scale,scale,c_white,1);
	})


	//Hat
	with_shader(sh_Colorize, function() {
		var y_frame = 128;
		var xx = x-x_offset;
		var yy = y-y_offset;
	
		shader_set_uniform_f_array(in_threshold, global.coloring.hat.v_threshhold);
		shader_set_uniform_f_array(in_red, global.coloring.hat.v_red);
		shader_set_uniform_f_array(in_green, global.coloring.hat.v_green);
		shader_set_uniform_f_array(in_blue, global.coloring.hat.v_blue);

		draw_sprite_part_ext(spr, 0, floor(x_frame)*frame_size, y_frame, frame_size, frame_size, xx,yy,scale,scale,c_white,1);
	})
} else if (flip == -1) {
	//Arm Staff
	with_shader(sh_Colorize, function() {
		var y_frame = 162;
		var xx = x-x_offset;
		var yy = y-y_offset;
	
		shader_set_uniform_f_array(in_threshold, global.coloring.staff.v_threshhold);
		shader_set_uniform_f_array(in_red, global.coloring.staff.v_red);
		shader_set_uniform_f_array(in_green, global.coloring.staff.v_green);
		shader_set_uniform_f_array(in_blue, global.coloring.staff.v_blue);

		draw_sprite_part_ext(spr, 0, 1+floor(x_frame)*frame_size, y_frame, frame_size, frame_size, xx,yy,scale,scale,c_white,1);
	})



	//Body
	with_shader(sh_Colorize, function() {
		var y_frame = 193;
		var xx = x-x_offset;
		var yy = y-y_offset;
	
		shader_set_uniform_f_array(in_threshold, global.coloring.body.v_threshhold);
		shader_set_uniform_f_array(in_red, global.coloring.body.v_red);
		shader_set_uniform_f_array(in_green, global.coloring.body.v_green);
		shader_set_uniform_f_array(in_blue, global.coloring.body.v_blue);

		draw_sprite_part_ext(spr, 0, 1+floor(x_frame)*frame_size, y_frame, frame_size, frame_size, xx,yy,scale,scale,c_white,1);
	})


	//Head
	with_shader(sh_Colorize, function() {
		var y_frame = 225;
		var xx = x-x_offset;
		var yy = y-y_offset;
	
		shader_set_uniform_f_array(in_threshold, global.coloring.skin.v_threshhold);
		shader_set_uniform_f_array(in_red, global.coloring.skin.v_red);
		shader_set_uniform_f_array(in_green, global.coloring.skin.v_green);
		shader_set_uniform_f_array(in_blue, global.coloring.skin.v_blue);

		draw_sprite_part_ext(spr, 0, 1+floor(x_frame)*frame_size, y_frame, frame_size, frame_size, xx,yy,scale,scale,c_white,1);
	})
	
	//Back Arm
	with_shader(sh_Colorize, function() {
		var y_frame = 257
		var xx = x-x_offset;
		var yy = y-y_offset;
	
		shader_set_uniform_f_array(in_threshold, global.coloring.skin.v_threshhold);
		shader_set_uniform_f_array(in_red, global.coloring.skin.v_red);
		shader_set_uniform_f_array(in_green, global.coloring.skin.v_green);
		shader_set_uniform_f_array(in_blue, global.coloring.skin.v_blue);

		draw_sprite_part_ext(spr, 0, 1+floor(x_frame)*frame_size, y_frame, frame_size, frame_size, xx,yy,scale,scale,c_white,1);
	})

	//Hat
	with_shader(sh_Colorize, function() {
		var y_frame = 289
		var xx = x-x_offset;
		var yy = y-y_offset;
	
		shader_set_uniform_f_array(in_threshold, global.coloring.hat.v_threshhold);
		shader_set_uniform_f_array(in_red, global.coloring.hat.v_red);
		shader_set_uniform_f_array(in_green, global.coloring.hat.v_green);
		shader_set_uniform_f_array(in_blue, global.coloring.hat.v_blue);

		draw_sprite_part_ext(spr, 0, 1+floor(x_frame)*frame_size, y_frame, frame_size, frame_size, xx,yy,scale,scale,c_white,1);
	})
}