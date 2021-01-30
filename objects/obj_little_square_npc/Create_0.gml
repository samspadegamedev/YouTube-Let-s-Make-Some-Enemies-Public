/// @description Little Square NPC


//method variables
enter_jumping_state = function() {
	state = "JUMPING";
	jump_count = jump_max;
	hsp = 0;
	jump();
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
jump_max = 3;
jump_count = jump_max;
jump_speed = -5;

//state variables
state = "WALKING";
alarm[0] = (room_speed * 3) + irandom(room_speed);