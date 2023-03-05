event_inherited();

image_index = irandom_range(0, image_number);
item_produced = item.none;
spr_tree = -1;
spr_tree_hit = -1;
hp = 10;

selected = false;
show_selected = false;
instance = id;

// Setup:
sys_particle = part_system_create()
part_system_layer(sys_particle, layer)
part_particle = part_type_create()
part_type_shape(part_particle, pt_shape_square)
part_type_sprite(part_particle, spr_leaf, 0, 0, 0)
part_type_size(part_particle, 0.5, 0.75, 0, 0)
part_type_scale(part_particle, 1, 1)
part_type_color3(part_particle, #4f8fba, #73bed3, #3c5e8b)
part_type_alpha3(part_particle, 0.25, 1, 0.25)
part_type_speed(part_particle, 0.04, 0.120, 0, 0.00)
part_type_direction(part_particle, 180, 359, 0, 0.40)
part_type_gravity(part_particle, 0.01, 200)
part_type_orientation(part_particle, 120, 270, 0, 1.20, 0.2)
part_type_blend(part_particle, 0)
part_type_life(part_particle, 85, 95)
emit_particle = part_emitter_create(sys_particle)

alarm[0] = 30


enum treestates {
	free,
	hit,
	destroy
}

state = treestates.free;
tree_states_array[treestates.free] = tree_free;
tree_states_array[treestates.hit] = tree_hit;
tree_states_array[treestates.destroy] = tree_destroy;