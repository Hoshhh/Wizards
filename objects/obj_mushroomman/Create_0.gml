event_inherited();
hp = 100;
flash = 0

path = path_add();
calc_path_delay = 30;
calc_path_timer = irandom(60);

attack_dis = 16;

counter = 0;
spd = 0.5;

my_dir = irandom_range(0,359);
moveX = lengthdir_x(spd, my_dir);
moveY = lengthdir_x(spd, my_dir);

state = ENEMYSTATE.IDLE;

//Enemy sprite
spr_move = spr_mushroom_run;

//Enemy Scripts
enemyScript[ENEMYSTATE.IDLE]		= MushroomIdle;
enemyScript[ENEMYSTATE.WANDER]		= MushroomWonder;
enemyScript[ENEMYSTATE.CHASE]		= MushroomChase;
enemyScript[ENEMYSTATE.ATTACK]		= MushroomAttack;