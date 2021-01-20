/// @description Little Square NPC




//movement variables
vsp = 0;
hsp = 0;
moving_speed = 3;
grav = 0.5;
dir = 1;

state = "WALKING";
jump_count = 3;
alarm[0] = (room_speed * 3) + irandom(room_speed);