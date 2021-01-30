/// @description Player Swapper


if (keyboard_check_pressed(vk_enter)) {
	
	if (instance_exists(obj_player_platformer)) {
		instance_destroy(obj_player_platformer);
		instance_create_layer(room_width/2, room_height/2, layer, obj_player_topdown);
	} else {
		instance_destroy(obj_player_topdown);
		instance_create_layer(room_width/2, room_height/2, layer, obj_player_platformer);
	}

}


