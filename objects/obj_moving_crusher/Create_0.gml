/// @description Moving Crusher


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

grav = 1;

hsp = 0;
vsp = 0;
accel = 0.1;
limit_speed = true;
max_speed = 2;


state = "SEEKING";
