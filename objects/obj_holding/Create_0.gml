depth = -2;
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

mx = mouse_x;
my = mouse_y;
color = c_red;

obj = -1;