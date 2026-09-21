

lobby_list = []

image_xscale = xScale
image_yscale = yScale

lobby_list[0] = instance_create_depth(x,bbox_top + 60,-20,obj_LobbyItem)



resetLobbyList = function () {
	for (var _i = 0; _i < array_length(lobby_list); _i = _i + 1) {
		show_debug_message("Deleting: "+string(lobby_list[_i]))
		instance_destroy(lobby_list[_i])}
		lobby_list = []}
		
on_net_event = function (evt) {
	if (evt.type == "lobby_join_failed") {show_debug_message("Could not join that lobby"); return}
	if (evt.type != "lobby_list") return
	
	resetLobbyList()
	if (array_length(evt.lobbies) == 0) {
		lobby_list[0] = instance_create_depth(x,bbox_top + 60,-20,obj_LobbyItem)}
		else {
			for (var _i = 0; _i < array_length(evt.lobbies); _i++) {
				var _l = evt.lobbies[_i]
				var _ins = instance_create_depth(x,bbox_top + 40 + 80*_i,-20,obj_LobbyItem, {
					lobby_index : _i,
					lobby_id : _l.code,
					lobby_creator : _l.creator})
					array_push(lobby_list, _ins)}}}
		net_lobby_list()
	