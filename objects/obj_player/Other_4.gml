if isLocal {
	var _pos = grab_spawn_point(0)
	x = _pos.x
	y = _pos.y
	camera_set_view_target(view_camera[0], id)
	respawn_other_players()}
	alarm[0] = 100
	instance_create_layer(0,0,"trans",obj_dark)
