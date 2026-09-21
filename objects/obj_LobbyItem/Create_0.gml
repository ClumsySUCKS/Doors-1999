hovered = false;
selected = false;
disabled = false;

selectAction = function () { global.client = instance_create_depth(0,0,0,obj_Client)
	net_lobby_join(lobby_id)
	show_debug_message("Clicked lobbyitem")};

textColor = c_white



