/// @description Little Square Jumper Crusher



switch (state) {

	case "WALKING": {
	
		//movement
		hsp = moving_speed * dir; 
	
		//turn around
		if (place_meeting(x + dir, y, solid_parent)) {
		    dir = dir * -1;
		}
				
		//switch to jumping if player is in vision cone
		if (point_distance(x, y, obj_player.x, obj_player.y) < max_distance) {
			var _angle_1 = point_direction(x, y, obj_player.x, obj_player.y);
			var _angle_2 = point_direction(0, 0, hsp, vsp);
			var _angle_dif = angle_difference(_angle_1, _angle_2);
			if (abs(_angle_dif) < max_angle) {
				enter_jumping_state();			
			}
			
		}
	
		break;
	
	}
		
	case "WAITING": {	
	
		//built in alarm 1 running - switches to WALKING

		break;
		
	}
		
	case "JUMPING": {
		
		if (place_meeting(x, y + 1, solid_parent)) {
		    enter_waiting_state();
		}	

		//wait for player to be directly under
		if (player_detected()) {
			hsp = 0;
			vsp = 0;
			state = "FALLING";	
		}

		break;
		
	}

	case "FALLING": {
	    if (place_meeting(x, y + 1, solid_parent)) {
	        enter_waiting_state();
	    }		
		break;
	}

}

vsp += grav;
move_and_collide();





