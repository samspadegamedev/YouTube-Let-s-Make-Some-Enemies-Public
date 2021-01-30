/// @description Little Square



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
		if (place_meeting(x, y, player_parent)) {
			alarm[0] = -1;
			enter_jumping_state();
		}
		
		break;
		
	case "WAITING": 	
	
		//built in alarm 1 running - switches to JUMPING
		
		//switch to jumping if colliding with player
		if (place_meeting(x, y, player_parent)) {
			alarm[1] = -1;
			enter_jumping_state();
		}
		
		break;
		
		
	case "JUMPING": 
		
		if (place_meeting(x, y + 1, solid_parent)) {
		    if (jump_count > 0) {
				jump();			
			} else {
				enter_waiting_state();
			}
		}	
				
		break;
		

}

vsp += grav;
move_and_collide();





