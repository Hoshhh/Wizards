event_inherited();

items_produced = [
	item.none
]
spr_rock = -1;
spr_rock_hit = -1;
hp = 10;

selected = false;
show_selected = false;
instance = id;

enum rockstates {
	free,
	hit,
	destroy
}

state = rockstates.free;
rock_states_array[rockstates.free] = rock_free;
rock_states_array[rockstates.hit] = rock_hit;
rock_states_array[rockstates.destroy] = rock_destroy;