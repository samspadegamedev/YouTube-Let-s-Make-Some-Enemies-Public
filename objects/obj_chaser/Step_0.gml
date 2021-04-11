/// @description Chaser


if (instance_exists(obj_player)) {
	hsp += sign(obj_player.x - x) * accel_force;
	vsp += sign(obj_player.y - y) * accel_force;
}

if (limit_speed) {
	hsp = clamp(hsp, -max_speed, max_speed);
	vsp = clamp(vsp, -max_speed, max_speed);
}

move_and_collide();