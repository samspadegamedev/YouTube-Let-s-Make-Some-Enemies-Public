/// @description Little Square NPC


enter_jumping_state = function() {
	hsp = 0;
	state = "JUMPING";
	jumps_remaining = jump_max;
	jump();
}

jump = function() {
	vsp = jump_speed;
	jumps_remaining -= 1;
}

enter_waiting_state = function() {
	hsp = 0;
	state = "WAITING";
	alarm[1] = room_speed + irandom(room_speed);
}

enter_walking_state = function() {
	state = "WALKING";
	alarm[0] = (room_speed * 3) + irandom(room_speed);
}

enter_waiting_state = function() {
	state = "WAITING";
	hsp = 0;
	alarm[1] = room_speed + irandom(room_speed);
}

jump = function() {
	vsp = jump_speed;
	jump_count -= 1;
}

//movement variables
vsp = 0;
hsp = 0;
moving_speed = 3;
grav = 0.5;
dir = 1;

//jump state variables
jump_speed = -5;
jump_max = 3;
jumps_remaining = jump_max;

//initilize state
enter_walking_state();

