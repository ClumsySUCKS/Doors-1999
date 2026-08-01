hovered = false;
selected = false;
disabled = false;

selectAction = function () { global.client = instance_create_depth(0,0,0,obj_client)
	steam_lobby_list_join(lobby_index)
	show_debug_message("Clicked lobbyitem")};

textColor = c_white



