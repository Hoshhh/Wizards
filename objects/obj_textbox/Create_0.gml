depth = -100;
box = spr_textbox;
frame = spr_portrait_frame;
portrait = spr_portraits;
namebox = spr_namebox;

scale = 1;


box_width = sprite_get_width(box)*scale;
box_height = sprite_get_height(box)*scale;
port_width = sprite_get_width(portrait)*scale;
port_height = sprite_get_height(portrait)*scale;
namebox_width = sprite_get_width(namebox)*scale;
namebox_height = sprite_get_height(namebox)*scale;


port_x = (320 - box_width - port_width ) * 0.5
port_y = (180 * 0.90) - port_height;
box_x = port_x + (port_width);
box_y = port_y;
namebox_x = box_x + (16*scale);
namebox_y = box_y - (16*scale);

x_buffer = 4*scale;
y_buffer = 4*scale;
text_x = box_x + x_buffer;
text_y = box_y + y_buffer;
name_text_x = namebox_x + (namebox_width/2);
name_text_y = namebox_y + (namebox_height/2) + 6;
text_max_width = box_width - (2*x_buffer);


port_index = 0;
counter = 0;
pause = false;

text_col = c_black;
name_text_col = c_black;
font = fnt_dialogue;

draw_set_font(font);
text_height = string_height("M");

text[0] = ""
page = 0;
npc_name = "";
voice = snd_voice1;

interact_key = vk_space;
choice = 0;
choice_col = c_yellow;

test = [];