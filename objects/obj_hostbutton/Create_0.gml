hovered = false
selected = false
disabled = false


selectAction = function () {
	global.server = instance_create_depth(0,0,0,obj_server);
	steam_lobby_create(steam_lobby_type_public, 4)
	var result = steam_lobby_create(steam_lobby_type_public, 4);
show_debug_message("Create returned: " + string(result));};