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
			state = "JUMPING";
			vsp = -5;
			jump_count -= 1;
			hsp = 0;
		}
		
		break;
		
	case "WAITING": 	
	
		//built in alarm 1 running - switches to JUMPING
		
		//switch to jumping if colliding with player
		if (place_meeting(x, y, player_parent)) {
			alarm[1] = -1;
			state = "JUMPING";
			vsp = -5;
			jump_count -= 1;
			hsp = 0;
		}
		
		break;
		
		
	case "JUMPING": 
	
		hsp = 0;
	
		if (place_meeting(x, y + 1, solid_parent)) {
		    if (jump_count > 0) {
				vsp = -5;
				jump_count -= 1;			
			} else {
				jump_count = 3;
				state = "WAITING";
				alarm[1] = room_speed + irandom(room_speed);
			}
		}	
		
		
		break;
		

}

vsp += grav;
move_and_collide();





