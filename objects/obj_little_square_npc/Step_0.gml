/// @description Little Square NPC



switch (state) {

	case "WALKING": 
	
		//movement
		hsp = moving_speed * dir; 
	
		//turn around
		if (place_meeting(x + dir, y, solid_parent)) {
		    dir = dir * -1;
		}
		
		//built in alarm 0 running - switches to WAITING
		
		//switch to jumping if colliding with player
		if (place_meeting(x, y, obj_player)) {
			alarm[0] = -1;
			hsp = 0;
			state = "JUMPING";
			jumps_remaining = jump_max;
			vsp = jump_speed;
			jumps_remaining -= 1;
			
		}
		
		break;
		
	case "WAITING": 	
	
		//built in alarm 1 running - switches to JUMPING
		
		//switch to jumping if colliding with player
		if (place_meeting(x, y, obj_player)) {
			alarm[1] = -1;
			hsp = 0;
			state = "JUMPING";
			jumps_remaining = jump_max;
			vsp = jump_speed;
			jumps_remaining -= 1;
		}
		
		break;
		
		
	case "JUMPING": 
	
		hsp = 0;
	
		if (place_meeting(x, y + 1, solid_parent)) {
		    if (jumps_remaining > 0) {
				vsp = jump_speed;
				jumps_remaining -= 1;			
			} else {
				state = "WAITING";
				alarm[1] = room_speed + irandom(room_speed);
			}
		}	
		
		
		break;
		

}

vsp += grav;
move_and_collide();





