hovered = false;
selected = false;
disabled = false;

selectAction = function () {if disabled == false { global.client = instance_create_depth(0,0,0,obj_Client)
	net_lobby_join(lobby_id) disabled = true
	show_debug_message("Clicked lobbyitem")}}

textColor = c_white



