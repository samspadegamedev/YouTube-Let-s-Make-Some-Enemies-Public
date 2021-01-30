/// @description Player Topdown


var _left, _right, _up, _down, _dir, _mag;
_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
_down = keyboard_check(vk_down) || keyboard_check(ord("S"));


_dir = point_direction(0, 0, _right - _left, _down - _up);
_mag = (_right != _left) || (_down != _up);


hsp = lengthdir_x(_mag * movement_speed, _dir);
vsp = lengthdir_y(_mag * movement_speed, _dir);

