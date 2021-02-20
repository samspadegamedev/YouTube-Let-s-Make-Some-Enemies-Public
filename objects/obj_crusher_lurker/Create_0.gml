/// @description Crusher


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
grav = 1;


//state variables
state  = "WAITING";


