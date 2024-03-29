event_inherited()

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

drop_move = true;
var itemdir = irandom_range(0,359);
var len = 8;
goal_x = x + lengthdir_x(len, itemdir);
goal_y = y + lengthdir_y(len, itemdir);

dayCreated = daycycle.day;
created_crop = false;

pickup_timer = 0;