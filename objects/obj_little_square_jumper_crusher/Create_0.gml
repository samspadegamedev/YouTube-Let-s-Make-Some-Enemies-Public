/// @description Little Square Jumper Crusher


enter_jumping_state = function() {
	state = "JUMPING";
	vsp = jump_speed;
	hsp = jump_force * dir;
}

enter_waiting_state = function() {
	hsp = 0;
	state = "WAITING";
	alarm[1] = room_speed + irandom(room_speed);
}

enter_walking_state = function() {
	if (instance_exists(obj_player)) {
		dir = sign(obj_player.x - x);
	}
	state = "WALKING";
}

//method variables
player_detected = function() {
	//wait for player to be directly under
	if (instance_exists(obj_player)) {
		if (collision_line(x, y, x, y + room_height, obj_player, false, true) != noone) &&
			(collision_line(x, y, obj_player.x, obj_player.y, solid_parent, false, true) == noone) {	
			return true;	
		}
	}
	return false;
}


//movement variables
vsp = 0;
hsp = 0;
moving_speed = 3;
grav = 0.5;
dir = 1;

//jump state variables
jump_speed = -14;
jump_force = 8;

//vision cone variables
max_distance = 300;
max_angle = 10;

//initilize state
enter_walking_state();

