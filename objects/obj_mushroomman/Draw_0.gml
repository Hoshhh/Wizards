draw_set_alpha(0.3)
draw_circle_color(x,y-8, enemyAggroRadius, c_white, c_white, false);
draw_set_alpha(1);

event_inherited();

c = c_white;
draw_set_font(fnt_dialogue);
draw_text_transformed_color(x-16, y - 32, "State: " + string(state), 0.2, 0.2, 0, c,c,c,c, 1)

draw_path(path, x, y, 0)