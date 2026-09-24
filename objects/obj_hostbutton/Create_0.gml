hovered = false
selected = false
disabled = false
pressed = false
image_speed = 0
alarm [0] = 500

selectAction = function () {
	net_lobby_create(2)};
	
	on_net_event = function (evt) {
		if (evt.type != "lobby_joined") return
		if (evt.is_host) {global.server = instance_create_depth(0,0,0,obj_Server)}
		random_set_seed(20260101) room_goto(rm_reception)}