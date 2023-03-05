aspect_ratio = display_get_width()/display_get_height();

view_height= 180//216; ///////
view_width=round(view_height*aspect_ratio);
 
if(view_width & 1) view_width++;
if(view_height & 1) view_height++;

max_window_scale = min(floor(display_get_width()/view_width),floor(display_get_height()/view_height));
if(view_height * max_window_scale == display_get_height())
    max_window_scale--;
    
window_scale = max_window_scale;

global.game_height = view_height * window_scale;
global.game_width = view_width * window_scale;

window_set_size(global.game_width,global.game_height);
display_set_gui_size(global.game_width,global.game_height);
alarm[0]=1;

surface_resize(application_surface, global.game_width, global.game_height);
room_goto(room_next(room));

target = id;
gifRecord = false;