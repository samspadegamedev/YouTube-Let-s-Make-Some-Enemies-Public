/// @description Player Platformer


var _left, _right, _jump_pressed;
_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
_jump_pressed = keyboard_check_pressed(vk_space);


hsp = (_right - _left) * movement_speed;
vsp += grav;

if (_jump_pressed) && (place_meeting(x, y + 1, solid_parent)) {
	vsp = jump_speed;
}

move_and_collide();

