ds_crops_types = -1;
ds_crops_instances = -1;
ds_crops_data = ds_grid_create(8,1);
ds_grid_clear(ds_crops_data, -1);

enum crop {
	centaury,
	wolfsbane
}

CreateCropType(1, 35, "Centaury");
CreateCropType(1, 40, "Wolfsbane");

planting = false;
selectCrop = 0;

mx = 0;
my = 0;

cellSize = 16;
planting_seq = 0;