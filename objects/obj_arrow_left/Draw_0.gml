if (position_meeting(mouse_x, mouse_y, id)) {
  draw_sprite(spr_arrow_left, 1, x, y);
}
else {
  draw_self();
}