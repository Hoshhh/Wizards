scale = display_manager.window_scale*0.9;
cell_size = 16;
item_spr = spr_inventory_items;
spr_width = sprite_get_width(item_spr);
spr_height = sprite_get_height(item_spr);

item_num = -1;
stack_num = -1;
x_frame = 0;
y_frame = 0;

x_offset = cell_size/2;
y_offset = cell_size * (2/3);

fade_away = false;
not_alpha = 1;
alarm[0] = 1.5*room_speed;

ds_notifications = -1;

font = fnt_dialogue;
draw_set_font(font);
str_height = string_height("M");

gui_height = display_get_gui_height();
text = "";

drop = false;
sell = false;