/// @description Enemy


//movement
hsp = moving_speed * dir; 
vsp += grav;
  
move_and_collide();


//turn around
if (place_meeting(x + dir, y, solid_parent)) {
    dir = dir * -1;
}