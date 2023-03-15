seconds = 21600;
minutes = 3600;
hours = 6;

day = 1;
season = 1;
year = 1;

prev_day = 1;

time_increment = 100;
time_pause = true;

maxdarkness = 0.8;
darkness = 0;
light_color = c_black;
draw_daylight = false;

test = 0;

guiWidth = display_get_gui_width();
guiHeight = display_get_gui_height();

notification = 0;
surface = -1;

enum phase {
	sunrise = 4.5,
	daytime = 6,
	sunset = 16,
	nighttime = 20,
}