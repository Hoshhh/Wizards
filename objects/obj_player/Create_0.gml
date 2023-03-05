event_inherited();
image_speed = 0;
image_index = 0;
//
x_frame = 0;
anim_len = 6;
frame_size = 32;
anim_spd = 12;
scale = 1;

spr = spr_idle;
flip = 1;
x_offset = sprite_get_xoffset(mask_index);
y_offset = sprite_get_yoffset(mask_index);

w_spd = 0.5;
n_spd = 1.25;
r_spd = 2;

currentSpell = 0;
casting = false;
farmSpellsRemaining = 1;

moving = false;

spd = n_spd;
moveX = 0;
moveY = 0;
facing = 0;

stamina = 75;
canSprint = true;

invulnerable = 0;
flash = 0;
flashShader = sh_white;
coolDown = 0;

idleTimer = 600;

enum states {
	free,
	spell,
	dialogue,
	cutscene
}

state = states.free;
states_array[states.free] = player_free;
states_array[states.spell] = player_farming_spell;
states_array[states.dialogue] = player_dialogue;
states_array[states.cutscene] = player_cutscene;


#region Shader handles

//Shader handles
in_threshold = shader_get_uniform(sh_Colorize, "in_threshold");
in_red = shader_get_uniform(sh_Colorize, "in_red");
in_green = shader_get_uniform(sh_Colorize, "in_green");
in_blue = shader_get_uniform(sh_Colorize, "in_blue");

#endregion

#region Dialogue

port_index = 0;
voice = snd_voice1;
npc_name = "Player";

radius = 16;
active_textbox = noone;

#endregion

display_manager.target = id;