//Execute state machine
if (enemyScript[state] != -1) {
	script_execute(enemyScript[state])
}

x += hSpeed;
y += vSpeed;