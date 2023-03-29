event_inherited();
hp = 100;
flash = 0

state = ENEMYSTATE.WANDER;

//Enemy sprite
spr_move = spr_bat;

//Enemy Scripts
enemyScript[ENEMYSTATE.WANDER]		= BatWonder;
enemyScript[ENEMYSTATE.CHASE]		= BatChase;
enemyScript[ENEMYSTATE.ATTACK]		= -1;