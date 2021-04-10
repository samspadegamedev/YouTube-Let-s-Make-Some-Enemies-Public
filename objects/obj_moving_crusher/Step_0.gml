/// @description Moving Crusher


//states - waiting, falling, rising
switch (state) {

    //lurking state
    case "SEEKING": {

		//seek player
		with (obj_player) {
			other.hsp += sign(x - other.x) * other.accel;
		}

		if (limit_speed) {
			hsp = clamp(hsp, -max_speed, max_speed);
		}


		//wait for player to be directly under
		if (player_detected()) {
			hsp = 0;
			state = "FALLING";	
		}
		
        break;
    }
    
    //falling state
    case "FALLING": {
		
		vsp += grav;
		
		//state is changed to RISING when alarm fires
		if (alarm[0] == -1) {
	        if (place_meeting(x, y + 1, solid_parent)) {
	            alarm[0] = room_speed;
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

