skipRoomSave = false;

//Used to determine the last save file the player was playing
global.savefile = -1;

global.statData = 
{
	chest_inv		: 0,
	crop_data		: 0,
	alchemy_data	: 0,
}

global.levelData = 
{
	levelMain	: 0,
	levelAlchemy	: 0,
}

//Loads the players settings in the init roon (last save file they were playing)
LoadSettings()