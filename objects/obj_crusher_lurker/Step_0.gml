/// @description Crusher


//states - waiting, falling, rising
switch (state) {

    //lurking state
    case "LURKING": {
		
		//wait for player to be directly under
		if (instance_exists(obj_player)) {
			if (collision_line(x, y, x, y + room_height, obj_player, false, true) != noone) state = "FALLING";	
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
		
        if (place_meeting(x, y - 1, solid_parent)) state = "LURKING";
		
        break;    
    }
    
}

move_and_collide();

