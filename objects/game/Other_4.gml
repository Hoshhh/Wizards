#macro TS 16

//get tiles in room
var _w = ceil(room_width/TS);
var _h = ceil(room_height/TS);

//create motion planning grid
global.mp_grid = mp_grid_create(0, 0, _w, _h, TS, TS)

//Add solid instances
mp_grid_add_instances(global.mp_grid, obj_collision, false)
if (instance_exists(obj_player)) {
	//mp_grid_clear_cell(global.mp_grid, floor(obj_player.x/TS) - 1, floor(obj_player.y/TS) - 1)	
	//mp_grid_clear_cell(global.mp_grid, ceil(obj_player.x/TS) + 1, floor(obj_player.y/TS) - 1)	
	with(obj_player) {
		mp_grid_clear_cell(global.mp_grid,floor(x/TS),floor(y/TS)-1);
		mp_grid_clear_cell(global.mp_grid,floor(x/TS)-1,floor(y/TS)-1);
	}
	
	with(enemy) {
		mp_grid_clear_cell(global.mp_grid,floor(x/TS),floor(y/TS)-1);
		mp_grid_clear_cell(global.mp_grid,floor(x/TS)-1,floor(y/TS)-1);
		
		mp_grid_clear_cell(global.mp_grid,floor(x/TS), floor(y/TS)-2 );
		mp_grid_clear_cell(global.mp_grid,floor(x/TS)-1, floor(y/TS)-2);
	}
	
}

if (spawnRoom == -1) exit;

obj_player.x = spawnX;
obj_player.y = spawnY;
obj_player.facing = spawnPlayerFacing;

