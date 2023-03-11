//Room saving 
function SaveRoom() {
	var _alchTableNum = instance_number(obj_alchemy_table);
	var _chestNum = instance_number(obj_chest);
	var _furnNum = instance_number(obj_furnace);
	
	var _roomStruct = {
		alchNum		: _alchTableNum,
		alchData	: array_create(_alchTableNum),
		chestNum	: _chestNum,
		chestData	: array_create(_chestNum),
		furnNum		: _furnNum,
		furnData	: array_create(_furnNum),
		
	}
	
	//Get the data from the savable objects
	
	//Alchemy Tables
	for (var i = 0; i < _alchTableNum; i++) {
		var _inst = instance_find(obj_alchemy_table, i);
		
		_roomStruct.alchData[i] = {
			x : _inst.x,
			y : _inst.y
		}
	}
	
	//Chests
	for (var i = 0; i < _chestNum; i++) {
		var _inst = instance_find(obj_chest, i);
		
		_roomStruct.chestData[i] = {
			x : _inst.x,
			y : _inst.y
		}
	}
	
	//Furnaces
	for (var i = 0; i < _furnNum; i++) {
		var _inst = instance_find(obj_furnace, i);
		
		_roomStruct.furnData[i] = {
			x : _inst.x,
			y : _inst.y
		}
	}
	
	//Store the struct in the global.level
	if (room == rm_main) { global.levelData.levelMain		= _roomStruct; }
	if (room == rm_alchemy) { global.levelData.levelAlchemy	= _roomStruct; }
}
	
//Room Loading
function LoadRoom() {
	var _roomStruct = 0;
	
	//Get the correct struct for the room you're in
	if room == rm_main		{ _roomStruct = global.levelData.levelMain }
	if room == rm_alchemy		{ _roomStruct = global.levelData.levelAlchemy }
	
	//Exit if room struct isnt a struct
	if !is_struct(_roomStruct) exit;
	
	//Rocks - get rid of the default room editior objects, then create new ones
	if (instance_exists(obj_alchemy_table)) { instance_destroy(obj_alchemy_table) }
	if (instance_exists(obj_chest)) { instance_destroy(obj_chest) }
	if (instance_exists(obj_furnace)) { instance_destroy(obj_furnace) }
	
	
	for (var i = 0; i < _roomStruct.alchNum; i++) {
		instance_create_layer(_roomStruct.alchData[i].x, _roomStruct.alchData[i].y, "Instances", obj_alchemy_table)
	}
	
	for (var i = 0; i < _roomStruct.chestNum; i++) {
		instance_create_layer(_roomStruct.chestData[i].x, _roomStruct.chestData[i].y, "Instances", obj_chest)
	}
	
	for (var i = 0; i < _roomStruct.furnNum; i++) {
		instance_create_layer(_roomStruct.furnData[i].x, _roomStruct.furnData[i].y, "Instances", obj_furnace)
	}
}
	
//Saving the game
function SaveGame(_fileNum = 0) {
	var _saveArray = array_create(0)
	
	//Save room
	SaveRoom()
	#region Object structs 
	//chests
	var _chestInvNum = instance_number(oChest);
	var _dataStruct = {
		chestInvNum	: _chestInvNum,
		chestInvData	: array_create(_chestInvNum),
	}
	
	//Furnaces
	var _furnInvNum = instance_number(oFurnace);
	var _furnStruct = {
		furnInvNum	: _furnInvNum,
		furnInvData	: array_create(_furnInvNum),
	}
	
	//crops obj
	var _cropDataNum = instance_number(crops);
	var _cropsStruct = {
		cropsNum	: _cropDataNum,
		cropsData : array_create(_cropDataNum)
	}
	
	//Alchemy
	var _alchemyNum = instance_number(oAlchemy);
	var _alchemyStruct = {
		alchemyNum	: _alchemyNum,
		alchemyData : array_create(_alchemyNum)
	}
	
	#endregion
	
	#region Loop through the number of instance and add their data to struct
	
	//Get the data from the savable objects
	//Chest
	for (var i = 0; i < _chestInvNum; i++) {
		var _inst = instance_find(oChest, i);
		_dataStruct.chestInvData[i] = {
			x : _inst.x,
			y : _inst.y,
			inventory : _inst.inventory
		}
	}
	
	//Furnace
	for (var i = 0; i < _furnInvNum; i++) {
		var _inst = instance_find(oFurnace, i);
		_furnStruct.furnInvData[i] = {
			x : _inst.x,
			y : _inst.y,
			inventory : _inst.inventory
		}
	}
	
	//Crops
	for (var i = 0; i < _cropDataNum; i++) {
		var _inst = instance_find(crops, i);
		_cropsStruct.cropsData[i] = {
			x : _inst.x,
			y : _inst.y,
			data : ds_grid_write(_inst.ds_crops_data)
		}
	}
	
	
	//Alchemy
	for (var i = 0; i < _alchemyNum; i++) {
		var _inst = instance_find(oAlchemy, i);
		_alchemyStruct.alchemyData[i] = {
			x : _inst.x,
			y : _inst.y,
		}
	}
	
	#endregion
	
	
	global.statData.chest_inv = _dataStruct
	global.statData.furnace_inv = _furnStruct
	global.statData.crop_data = _cropsStruct
	global.statData.alchemy_data = _alchemyStruct
	array_push(_saveArray, global.statData)
	array_push(_saveArray, global.levelData)
	array_push(_saveArray, global.coloring)
	
	//Actual saving
	var _filename = "savedata" + string(_fileNum) +".sav"
	var _json = json_stringify(_saveArray);
	var _buffer = buffer_create( string_byte_length(_json) + 1, buffer_fixed, 1);
	
	buffer_write(_buffer, buffer_string, _json);
	buffer_save( _buffer, _filename)
	buffer_delete(_buffer);
}
	
//Loading saved data
function LoadGame(_fileNum = 0) {
	var _filename = "savedata" + string(_fileNum) +".sav";
	if !file_exists(_filename) exit;
	
	//Load buffer, get json, delete buffer
	var _buffer = buffer_load(_filename);
	var _json = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	//Parse the json data
	var _loadArray = json_parse(_json);
	
	//Set data in the game to match the loaded array data
	global.statData = array_get(_loadArray, 0);
	global.levelData = array_get(_loadArray, 1);
	global.coloring = array_get(_loadArray, 2); //Used to load players customization, does everything
	
	#region Load object data
	
	//Load chests
	var _chestData = global.statData.chest_inv
	for (var i = 0; i < _chestData.chestInvNum; i++) {
		with(instance_create_layer(_chestData.chestInvData[i].x, _chestData.chestInvData[i].y, "Instances", oChest)) {
			inventory = _chestData.chestInvData[i].inventory;
		}
	}
	
	//Load furnaces
	var _furnData = global.statData.furnace_inv
	for (var i = 0; i < _furnData.furnInvNum; i++) {
		with(instance_create_layer(_furnData.furnInvData[i].x, _furnData.furnInvData[i].y, "Instances", oFurnace)) {
			inventory = _furnData.furnInvData[i].inventory;
		}
	}
	
	//Load crops object
	var _cropData = global.statData.crop_data
	for (var i = 0; i < _cropData.cropsNum; i++) {
		with(crops) {
			x = _cropData.cropsData[i].x;
			y = _cropData.cropsData[i].y;
			ds_grid_read(ds_crops_data, _cropData.cropsData[i].data);
		}
	}
	
	
	//Load Alchemy
	var _alchemyData = global.statData.alchemy_data
	for (var i = 0; i < _alchemyData.alchemyNum; i++) {
		with(instance_create_layer(_alchemyData.alchemyData[i].x, _alchemyData.alchemyData[i].y, "Instances", oAlchemy)) {
			//ds_grid_read(ds_alchemy, _alchemyData.alchemyData[i].alchemy_inv);
		}
	}
	
	#endregion
	
	oSaveLoad.skipRoomSave = true;
	LoadRoom();
}


function SaveSettings() {
	var _saveSettingsArray = array_create(0)
	
	array_push(_saveSettingsArray, global.savefile)

	
	//Actual saving
	var _filename = "settings" + ".sav"
	var _json = json_stringify(_saveSettingsArray);
	var _buffer = buffer_create( string_byte_length(_json) + 1, buffer_fixed, 1);
	
	buffer_write(_buffer, buffer_string, _json);
	buffer_save( _buffer, _filename)
	buffer_delete(_buffer);
}
	
function LoadSettings() {
	var _filename = "settings" + ".sav";
	if !file_exists(_filename) exit;
	
	//Load buffer, get json, delete buffer
	var _buffer = buffer_load(_filename);
	var _json = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	//Parse the json data
	var _loadArray = json_parse(_json);
	
	//Set settings data to match the loaded array settings
	global.savefile = array_get(_loadArray, 0);
	
}