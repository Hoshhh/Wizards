//Input
confirm_key = vk_space;

//Position
margin = 16;
padding = 8;
width = display_get_gui_width() - margin*2;
height = sprite_height;

x = (display_get_gui_width() - width) / 2;
y = display_get_gui_height() - height - margin;

//Text
text_font = fnt_dialogue;
text_color = c_white;
text_speed = 0.6;
text_x = padding;
text_y = padding;
text_width = width - padding*2;