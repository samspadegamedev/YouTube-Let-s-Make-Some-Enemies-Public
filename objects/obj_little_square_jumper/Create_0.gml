/// @description Little Square Jumper


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
	state = "WALKING";
}


//movement variables
vsp = 0;
hsp = 0;
moving_speed = 3;
grav = 0.5;
dir = 1;

//jump state variables
jump_speed = -7;
jump_force = 8;

//vision cone variables
max_distance = 300;
max_angle = 10;

//initilize state
enter_walking_state();

