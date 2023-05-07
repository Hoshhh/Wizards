if (show_inventory) exit;
if (room = rm_creator) exit;
if (instance_exists(obj_cutscene)) exit;
//if (room == rm_menu) exit;


var inv = inventory;
var tb_item = inv[bar_selected_slot].itemInSlot
var num = inv[bar_selected_slot].amount;
var _obj = inv[bar_selected_slot].obj;


#region selecting

if (keyboard_check_pressed(ord("1")))
{
	//
	bar_selected_prev = bar_selected_slot;
	bar_selected_slot = 0;
		
	if (bar_selected_slot == 0 and !instance_exists(obj_holding)) {
		//show_debug_message("true")
		var inst = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_holding);
			
		with(inst) {
			item_num = tb_item; 
			stack_num = num; //1
			obj = _obj;
			x_frame = item_num mod (spr_width/cell_size);
			y_frame = item_num div (spr_width/cell_size);	
		}
	} else { show_debug_message("false")}
}

if (keyboard_check_pressed(ord("2"))) {

	bar_selected_prev = bar_selected_slot;
	bar_selected_slot = 1;	
	
	if (bar_selected_slot == 1 and !instance_exists(obj_holding)) {
		var inst = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_holding);
			
		with(inst) {
			item_num = tb_item; 
			stack_num = num; //1
			obj = _obj;
			x_frame = item_num mod (spr_width/cell_size);
			y_frame = item_num div (spr_width/cell_size);	
		}
	}
}

if (keyboard_check_pressed(ord("3"))){
	bar_selected_prev = bar_selected_slot;
	bar_selected_slot = 2;	
	
	if (bar_selected_slot == 2 and !instance_exists(obj_holding)) {
		var inst = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_holding);
			
		with(inst) {
			item_num = tb_item; 
			stack_num = num; //1
			obj = _obj;
			x_frame = item_num mod (spr_width/cell_size);
			y_frame = item_num div (spr_width/cell_size);	
		}
	}
}

if (keyboard_check_pressed(ord("4")))
{
	bar_selected_prev = bar_selected_slot;
	bar_selected_slot = 3;	
	
	if (bar_selected_slot == 3 and !instance_exists(obj_holding)) {
		var inst = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_holding);
			
		with(inst) {
			item_num = tb_item; 
			stack_num = num; //1
			obj = _obj;
			x_frame = item_num mod (spr_width/cell_size);
			y_frame = item_num div (spr_width/cell_size);	
		}
	}
}

if (keyboard_check_pressed(ord("5")))
{
	bar_selected_prev = bar_selected_slot;
	bar_selected_slot = 4;
	
	if (bar_selected_slot == 4 and !instance_exists(obj_holding)) {
		var inst = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_holding);
			
		with(inst) {
			item_num = tb_item; 
			stack_num = num; //1
			obj = _obj;
			x_frame = item_num mod (spr_width/cell_size);
			y_frame = item_num div (spr_width/cell_size);	
		}
	}
}

if (keyboard_check_pressed(ord("6")))
{
		bar_selected_prev = bar_selected_slot;
		bar_selected_slot = 5;	
		
		if (bar_selected_slot == 5 and !instance_exists(obj_holding)) {
		var inst = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_holding);
			
		with(inst) {
			item_num = tb_item; 
			stack_num = num; //1
			obj = _obj;
			x_frame = item_num mod (spr_width/cell_size);
			y_frame = item_num div (spr_width/cell_size);	
		}
	}
}

#endregion

