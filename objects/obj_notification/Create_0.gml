scale = 1;
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
str_height = 0.2*string_height("M");

gui_height = display_get_gui_height();
text = "";

drop = false;
sell = false;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

item_ui_width = 20;
item_ui_height = 24;

text_ui_width = 24;
text_ui_height = 24;

spr_item = spr_item_container;
spr_text = spr_text_container;

not_ui_x = (gui_width * 0.8) - (item_ui_width * 0.5 * scale);
not_ui_y = (gui_height * 0.9) - (item_ui_height * 0.3 * scale);

item_x = not_ui_x + (4 * scale);
item_y = not_ui_y + (4 * scale);

text_x = not_ui_x + (25 * scale);
text_y = not_ui_y + (5 * scale);