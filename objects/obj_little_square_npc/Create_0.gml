/// @description Little Square NPC


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
state = "WALKING";
alarm[0] = (room_speed * 3) + irandom(room_speed);