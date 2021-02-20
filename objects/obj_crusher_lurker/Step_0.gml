/// @description Crusher


//states - waiting, falling, rising
switch (state) {

    //lurking state
    case "WAITING": {
		
		//wait for player to be directly under
		if (player_detected()) {
			state = "FALLING";	
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
		
        if (place_meeting(x, y - 1, solid_parent)) state = "WAITING";
		
        break;    
    }
    
}

move_and_collide();

