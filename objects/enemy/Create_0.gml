event_inherited();
collideable = false;

enum ENEMYSTATE {
	IDLE,
	WANDER,
	ALERT,
	RETREAT,
	CHASE,
	ATTACK,
	HURT,
	DIE,
}

state = ENEMYSTATE.IDLE;
hSpeed = 0;
vSpeed = 0;
xTo = xstart;
yTo = ystart;
direct = 0;
time_passed = 0;
waitDuration = 60;
wait = 0;

enemyWanderDistance = 32;
enemySpeed = 0.75;
enemyAggroRadius = 48;

//Aggro
aggroCheck = 0;
aggroCheckDuration = 5;

//Enemy Sprites
spr_move = spr_bat;

//Enemy Functions
enemyScript[ENEMYSTATE.IDLE] = -1;
enemyScript[ENEMYSTATE.WANDER] = -1;
enemyScript[ENEMYSTATE.ALERT] = -1;
enemyScript[ENEMYSTATE.RETREAT] = -1;
enemyScript[ENEMYSTATE.CHASE] = -1;
enemyScript[ENEMYSTATE.ATTACK] = -1;
enemyScript[ENEMYSTATE.HURT] = -1;
enemyScript[ENEMYSTATE.DIE] = -1;