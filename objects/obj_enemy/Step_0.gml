/// @description Enemy


//move
hsp = moving_speed * dir; 
vsp += grav;
  
  
//collide
move_and_collide();


//turn around
if (place_meeting(x + dir, y, solid_parent)) {
    dir = dir * -1;
}