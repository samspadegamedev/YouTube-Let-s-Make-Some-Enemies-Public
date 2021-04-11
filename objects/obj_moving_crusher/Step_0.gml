/// @description Crusher


//states - seeking, falling, rising
switch (state) {

    //seeking state
    case "SEEKING": {
	
		//move towards the player
		if (instance_exists(obj_player)) {
			hsp += sign(obj_player.x - x) * accel_force;
		}

		if (limit_speed) {
			hsp = clamp(hsp, -max_speed, max_speed);
		}
	
		//wait for player to be directly under
		if (player_detected()) {
			state = "FALLING";	
			hsp = 0;
		}
		
        break;
    }
    
    //falling state
    case "FALLING": {
		
		vsp += grav;
		
		//state is changed to RISING when alarm fires
		if (alarm[1] == -1) {
	        if (place_meeting(x, y + 1, solid_parent)) {
	            alarm[1] = room_speed;
	        }
		}
		
        break;    
    }
    
    //exploding state
    case "RISING": {
		
		vsp += -grav;
		vsp = clamp(vsp, -2, 0); 
		
        if (place_meeting(x, y - 1, solid_parent)) state = "SEEKING";
		
        break;    
    }
    
}

move_and_collide();

