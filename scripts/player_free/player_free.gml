function player_free(){
	input_left		= keyboard_check(ord("A"));
	input_right		= keyboard_check(ord("D"));
	input_up		= keyboard_check(ord("W"));
	input_down		= keyboard_check(ord("S"));
	input_cast		= mouse_check_button_pressed(mb_left);
	input_walk		= keyboard_check(vk_control);
	input_run		= keyboard_check(vk_shift);
	input_interact	= keyboard_check_pressed(ord("F"));
	
	//Alter speed
	if (input_walk || (input_run and canSprint)) {
		spd = abs((input_walk * w_spd) - (input_run * r_spd));
	} else {
		spd = n_spd;	
	}

	moveX = 0;
	moveY = 0;


	//Only move left and right if the player is not moving up or down
	var hor = (input_right - input_left)
	var vert = (input_down - input_up)
	var diagonalSpeed = spd * 0.707;
	

	//Normalize the Diagonal movement
	if (hor != 0 and vert != 0) {
		moveX = hor * diagonalSpeed;
		moveY = vert * diagonalSpeed;
	} else {
		moveX = hor * spd;
		moveY = vert * spd;
	}

	//--------GET DIRECTION PLAYER IS FACING
	if (moveX != 0)
	{
		switch(sign(moveX))
		{
			case 1: facing = dir.right; break;
			case -1: facing = dir.left; break;
		}
	}
	else if (moveY != 0)
	{
		switch(sign(moveY))
		{
			case 1: facing = dir.down; break;
			case -1: facing = dir.up; break;
		}
	}
	else
	{
		facing = -1;	
	}


	//-----COLLISION CHECKS
	//Horizontal
	if (moveX != 0) {
		var collisionH = instance_place(x + moveX, y, obj_collision)
		if (collisionH != noone and collisionH.collideable) {
			repeat(abs(moveX))
			{
				if (!place_meeting(x+sign(moveX), y, obj_collision)) {
					x += sign(moveX);
				} else { break; }
			}
			moveX = 0;
		}
	}

	if (moveY != 0) {
		var collisionV = instance_place(x, y+moveY, obj_collision)
		if (collisionV != noone and collisionV.collideable) {
			repeat(abs(moveY))
			{
				if (!place_meeting(x, y+sign(moveY), obj_collision)) {
					y += sign(moveY);
				} else { break; }
			}
			moveY = 0;
		}
	}
	
	//Collision with transition
	var inst = instance_place(x,y, obj_transition);
	if (inst != noone and facing == inst.playerFacingBefore) {
		with(game) {
			if (!doTransition) {
				spawnRoom = inst.targetRoom;
				spawnX = inst.targetX;
				spawnY = inst.targetY;
				spawnPlayerFacing = inst.playerFacingAfter;
				doTransition = true;
			}
		}
		
	}
	
	//Collisions with NPCs
	//Text Box
	if (input_interact)
	{
		if (active_textbox == noone)
		{
			var inst = collision_rectangle(x-radius, y-radius, x+radius, y+radius, par_npc, false, false);
	
			if (inst != noone)
			{
				with(inst)
				{
					var tbox = create_textbox(text, speakers, next_line, scripts);
					can_move = false;
					moveX = 0; moveY = 0;
					change_variable(display_manager, "target", id);
				}
				active_textbox = tbox;
			}
		}
	} else {
		if (!instance_exists(active_textbox))
		{
			active_textbox = noone;
		}
	}
	
	
	if (instance_exists(active_textbox)) state = states.dialogue;
	

		
	//Apply movement
	x += moveX;
	y += moveY;
	
	#region Sprinting
	
	if (input_run and (moveX >= 2 or moveX <= -2 or moveY >= 2 or moveY <= -2)) {
		stamina--;	
	} else {
		stamina += 0.5;	
	}
	
	if (stamina <= 0 ) {
		spd = n_spd;
		canSprint = false;
	}
	
	if (stamina >= 75) {stamina = 75; canSprint = true;}

	#endregion

	if (instance_exists(obj_cutscene)) {
		state = states.cutscene;	
	}
	
	//Temporary combat solution
	if (keyboard_check_pressed(ord("Q")) and distance_to_object(enemy) < 100 and coolDown < 1) {
		x_frame = 0;
		spr = spr_spell_attack;
		state = states.attack;
		casting = true;	
		coolDown = 20;
	}
	
	coolDown--;
	
	
	//Update Sprite
	switch(facing)
	{
		case dir.left:		spr = spr_run; image_speed = 1; flip = 1; break;
		case dir.right: 	spr = spr_run; image_speed = 1; flip = -1; break;
		case dir.up: 		spr = spr_run; image_speed = 1;					break;
		case dir.down: 		spr = spr_run; image_speed = 1;					break;
		case -1: 			spr = spr_idle; image_speed = 0; image_index = 0;	break;
	}
	
	#region Idling
	
	//Idle animations
	if (keyboard_check(vk_nokey) and mouse_check_button(mb_none)) {
		idleTimer--;
	} else {
		idleTimer = 600;
		anim_len = 6;
	}
	
	if (idleTimer <= 0) { 
		spr = spr_longidle;
		anim_len = 34
		
		if (x_frame >= 33) {
			spr = spr_idle;	
			idleTimer = 600;
			anim_len = 6;
		}
	}
	
	#endregion
	
	if (obj_player.currentSpell == 0 and input_cast and oInventory.show_inventory != true and crops.planting != true ) {
		x_frame = 0;
		spr = spr_farm;
		image_index = 0;
		image_speed = 1;
		state = states.spell;
		casting = true;	
		idleTimer = 600;
	}

}