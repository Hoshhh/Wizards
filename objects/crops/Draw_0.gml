if (!planting) exit;

var cs = cellSize;
var gx = (mx div cs)
var gy = (my div cs)


var cell = ds_crops_instances[# gx, gy]
var xx = gx*cs;
var yy = gy*cs;

 draw_sprite(spr_plant_select, 1, xx, yy)

if (cell == 0) {
	var lay_id = layer_get_id("Dirt");
	var map_id = layer_tilemap_get_id(lay_id);
	var data = tilemap_get_at_pixel(map_id, mx, my);

	if (data != 0) { draw_sprite(spr_plant_select, 0, xx, yy) }
}


draw_sprite(spr_crops_picked, selectCrop, xx, yy)