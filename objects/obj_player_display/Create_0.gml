x_frame = 0;
anim_len = 6;
frame_size = 32;
anim_spd = 12;
scale = 1;

spr = spr_idle;
flip = 1;
x_offset = sprite_get_xoffset(mask_index);
y_offset = sprite_get_yoffset(mask_index);


#region Shader handles

//Shader handles
in_threshold = shader_get_uniform(sh_Colorize, "in_threshold");
in_red = shader_get_uniform(sh_Colorize, "in_red");
in_green = shader_get_uniform(sh_Colorize, "in_green");
in_blue = shader_get_uniform(sh_Colorize, "in_blue");

#endregion