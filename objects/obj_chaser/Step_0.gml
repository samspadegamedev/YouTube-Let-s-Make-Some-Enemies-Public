/// @description Chaser


with (obj_player) {
	other.hsp += sign(x - other.x) * other.accel;
	other.vsp += sign(y - other.y) * other.accel;
}

if (limit_speed) {
	hsp = clamp(hsp, -max_speed, max_speed);
	vsp = clamp(vsp, -max_speed, max_speed);
}

move_and_collide();

