//Increment frame for animation
x_frame += anim_spd/60;
if(x_frame >= anim_len) x_frame = 0;


if (flip == 1) {
	//Arm Staff
	with_shader(sh_Colorize, function() {
		var y_frame = 1;
		var xx = x-x_offset;
		var yy = y-y_offset;
	
		shader_set_uniform_f_array(in_threshold, customizer.staffChoice.v_threshhold);
		shader_set_uniform_f_array(in_red, customizer.staffChoice.v_red);
		shader_set_uniform_f_array(in_green, customizer.staffChoice.v_green);
		shader_set_uniform_f_array(in_blue, customizer.staffChoice.v_blue);

		draw_sprite_part_ext(spr, 0, floor(x_frame)*frame_size, y_frame, frame_size, frame_size, xx,yy,scale,scale,c_white,1);
	})



	//Body
	with_shader(sh_Colorize, function() {
		var y_frame = 33;
		var xx = x-x_offset;
		var yy = y-y_offset;
	
		shader_set_uniform_f_array(in_threshold, customizer.bodyChoice.v_threshhold);
		shader_set_uniform_f_array(in_red, customizer.bodyChoice.v_red);
		shader_set_uniform_f_array(in_green, customizer.bodyChoice.v_green);
		shader_set_uniform_f_array(in_blue, customizer.bodyChoice.v_blue);

		draw_sprite_part_ext(spr, 0, floor(x_frame)*frame_size, y_frame, frame_size, frame_size, xx,yy,scale,scale,c_white,1);
	})


	//Head
	with_shader(sh_Colorize, function() {
		var y_frame = 65;
		var xx = x-x_offset;
		var yy = y-y_offset;
	
		shader_set_uniform_f_array(in_threshold, customizer.skinChoice.v_threshhold);
		shader_set_uniform_f_array(in_red, customizer.skinChoice.v_red);
		shader_set_uniform_f_array(in_green, customizer.skinChoice.v_green);
		shader_set_uniform_f_array(in_blue, customizer.skinChoice.v_blue);

		draw_sprite_part_ext(spr, 0, floor(x_frame)*frame_size, y_frame, frame_size, frame_size, xx,yy,scale,scale,c_white,1);
	})


	//Back Arm
	with_shader(sh_Colorize, function() {
		var y_frame = 97;
		var xx = x-x_offset;
		var yy = y-y_offset;
	
		shader_set_uniform_f_array(in_threshold, customizer.skinChoice.v_threshhold);
		shader_set_uniform_f_array(in_red, customizer.skinChoice.v_red);
		shader_set_uniform_f_array(in_green, customizer.skinChoice.v_green);
		shader_set_uniform_f_array(in_blue, customizer.skinChoice.v_blue);

		draw_sprite_part_ext(spr, 0, floor(x_frame)*frame_size, y_frame, frame_size, frame_size, xx,yy,scale,scale,c_white,1);
	})


	//Hat
	with_shader(sh_Colorize, function() {
		var y_frame = 129;
		var xx = x-x_offset;
		var yy = y-y_offset;
	
		shader_set_uniform_f_array(in_threshold, customizer.hatChoice.v_threshhold);
		shader_set_uniform_f_array(in_red, customizer.hatChoice.v_red);
		shader_set_uniform_f_array(in_green,customizer.hatChoice.v_green);
		shader_set_uniform_f_array(in_blue, customizer.hatChoice.v_blue);

		draw_sprite_part_ext(spr, 0, floor(x_frame)*frame_size, y_frame, frame_size, frame_size, xx,yy,scale,scale,c_white,1);
	})
} else if (flip == -1) {
	//Arm Staff
	with_shader(sh_Colorize, function() {
		var y_frame = 161;
		var xx = x-x_offset;
		var yy = y-y_offset;
	
		shader_set_uniform_f_array(in_threshold, customizer.staffChoice.v_threshhold);
		shader_set_uniform_f_array(in_red, customizer.staffChoice.v_red);
		shader_set_uniform_f_array(in_green, customizer.staffChoice.v_green);
		shader_set_uniform_f_array(in_blue, customizer.staffChoice.v_blue);

		draw_sprite_part_ext(spr, 0, 1+floor(x_frame)*frame_size, y_frame, frame_size, frame_size, xx,yy,scale,scale,c_white,1);
	})



	//Body
	with_shader(sh_Colorize, function() {
		var y_frame = 193;
		var xx = x-x_offset;
		var yy = y-y_offset;
	
		shader_set_uniform_f_array(in_threshold, customizer.bodyChoice.v_threshhold);
		shader_set_uniform_f_array(in_red, customizer.bodyChoice.v_red);
		shader_set_uniform_f_array(in_green, customizer.bodyChoice.v_green);
		shader_set_uniform_f_array(in_blue, customizer.bodyChoice.v_blue);

		draw_sprite_part_ext(spr, 0, 1+floor(x_frame)*frame_size, y_frame, frame_size, frame_size, xx,yy,scale,scale,c_white,1);
	})


	//Head
	with_shader(sh_Colorize, function() {
		var y_frame = 225;
		var xx = x-x_offset;
		var yy = y-y_offset;
	
		shader_set_uniform_f_array(in_threshold, customizer.skinChoice.v_threshhold);
		shader_set_uniform_f_array(in_red, customizer.skinChoice.v_red);
		shader_set_uniform_f_array(in_green, customizer.skinChoice.v_green);
		shader_set_uniform_f_array(in_blue, customizer.skinChoice.v_blue);

		draw_sprite_part_ext(spr, 0, 1+floor(x_frame)*frame_size, y_frame, frame_size, frame_size, xx,yy,scale,scale,c_white,1);
	})
	
	//Back Arm
	with_shader(sh_Colorize, function() {
		var y_frame = 257
		var xx = x-x_offset;
		var yy = y-y_offset;
	
		shader_set_uniform_f_array(in_threshold, customizer.skinChoice.v_threshhold);
		shader_set_uniform_f_array(in_red, customizer.skinChoice.v_red);
		shader_set_uniform_f_array(in_green, customizer.skinChoice.v_green);
		shader_set_uniform_f_array(in_blue, customizer.skinChoice.v_blue);

		draw_sprite_part_ext(spr, 0, 1+floor(x_frame)*frame_size, y_frame, frame_size, frame_size, xx,yy,scale,scale,c_white,1);
	})

	//Hat
	with_shader(sh_Colorize, function() {
		var y_frame = 289
		var xx = x-x_offset;
		var yy = y-y_offset;
	
		shader_set_uniform_f_array(in_threshold, customizer.hatChoice.v_threshhold);
		shader_set_uniform_f_array(in_red, customizer.hatChoice.v_red);
		shader_set_uniform_f_array(in_green, customizer.hatChoice.v_green);
		shader_set_uniform_f_array(in_blue, customizer.hatChoice.v_blue);

		draw_sprite_part_ext(spr, 0, 1+floor(x_frame)*frame_size, y_frame, frame_size, frame_size, xx,yy,scale,scale,c_white,1);
	})
}