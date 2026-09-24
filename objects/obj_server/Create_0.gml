
playerList = []

steamID = net_my_id()
steamName = global.player_name
lobbyMemberID = 0
character = undefined

inbuf = buffer_create(16, buffer_grow, 1);


			
playerList[0] = {
	steamID			: steamID,
	steamName		: steamName,
	character		: undefined,
	startPos		: grab_spawn_point(0),
	lobbyMemberID	: 0
	}

on_net_event = function (evt) {
	switch (evt.type) {
		case "peer_joined":
		show_debug_message("Player Joined: " + evt.name)
		var _existing = -1
		for (var _i = 0; _i < array_length(playerList); _i++) {
			if (playerList[_i].steamID == evt.pid) {_existing = _i; break}}
		var _slot = undefined
		if _existing >= 0 {
			_slot  = _existing
			playerList[_slot].steamName = evt.name}
			else {_slot = array_push(playerList, {
			steamID: evt.pid,
			steamName: evt.name,
			character: undefined,
			startPos: grab_spawn_point(_slot),
			lobbyMemberID: _slot})}
			
			send_player_sync(evt.pid)
			send_player_spawn(evt.pid, _slot)
			break	
		
		case "peer_left":
		for (var _i = array_length(playerList) - 1; _i >= 0; _i--) {
			if (playerList[_i].steamID == evt.pid) {
				if (playerList[_i].character != undefined && instance_exists(playerList[_i].character)) {
					instance_destroy(playerList[_i].character)}
				array_delete(playerList, _i, 1)}} break
		case "disconnected":
		game_restart()
		break}}
		
	global.room_seed = irandom(999999999)