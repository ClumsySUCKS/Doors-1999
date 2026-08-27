hovered = false
selected = false
disabled = false
pressed = false
image_speed = 0
alarm [0] = 500

selectAction = function () {show_debug_message("FUCK")
	global.server = instance_create_depth(0,0,0,obj_Server);
	steam_lobby_create(steam_lobby_type_public, 4)};