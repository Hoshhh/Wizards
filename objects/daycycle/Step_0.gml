if (keyboard_check_pressed(ord("T"))) { time_pause = !time_pause; }
if (time_pause) exit;

//Increment time
seconds += time_increment;
minutes = seconds/60;
hours = minutes/60;
notification--;


//if draw_daylight
#region Phases and Variables
var darks, colors, pstart, pend;
if (hours > phase.sunrise and hours <= phase.daytime) {
	//Sunrise
	darks = [maxdarkness, 0.2];
	colors = [merge_color(c_black, c_orange, 0.1)];
	pstart = phase.sunrise;
	pend = phase.daytime;
} else if (hours > phase.daytime and hours <= phase.sunset) {
	//Daytime 	
	darks = [0, 0,0,0, 0.2];
	colors = [c_orange, c_orange, c_white, c_orange, c_orange]
	pstart = phase.daytime;
	pend = phase.sunset;
} else if (hours > phase.sunset and hours <= phase.nighttime) {
	//Sunset
	darks = [0.2, maxdarkness];
	colors = [c_orange, c_black, merge_color(c_black, c_navy, 0.1)];
	pstart = phase.sunset;
	pend = phase.nighttime;
} else {
	//Night	
	darks = [maxdarkness];
	colors = [merge_color(c_black, c_navy, 0.1)];
	pstart = phase.nighttime;
	pend = phase.sunrise;
}
#endregion

#region Alter darkness and colors depending on time
//Colors
if (pstart == phase.nighttime){ light_color = colors[0]; }
else {
	var cc = ((hours - pstart) / (pend - pstart)) * (array_length_1d(colors) - 1);
	var c1 = colors[floor(cc)];
	var c2 = colors[ceil(cc)];

	light_color = merge_color(c1, c2, cc - floor(cc));
}
//Darkness
if (pstart == phase.nighttime){ darkness = darks[0]; }
else {
	var dd = ((hours - pstart) / (pend - pstart)) * (array_length_1d(darks) - 1);
	var d1 = darks[floor(dd)];
	var d2 = darks[ceil(dd)];

	darkness = lerp(d1, d2, dd - floor(dd));
}
#endregion

#region Cycle check
if (hours >= 24) {
	seconds = 0;
	prev_day = day;
	day += 1;
	notification = 180;
	
	with(crops) {
		event_perform(ev_other, ev_user1);
		var inst_num = ds_grid_height(ds_crops_data);	
		var slot = 0; repeat(inst_num) {
			ds_crops_data[# 4, slot] = false;		
			slot += 1;
		}
	}
	
	with(obj_crop) {
		watered = false;	
	}
	
	if (day > 28) {
		day = 1;
		season += 1;
		
		if (season > 4) {
			season = 1;
			year += 1;
		}
	}
}
#endregion

if (notification <= 0) notification = 0;