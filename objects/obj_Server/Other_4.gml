if (!instance_exists(obj_player)) {
	var _pos = grab_spawn_point(0)
	var _inst = instance_create_layer(_pos.x,_pos.y,"Player",obj_player, {
		steamName: global.player_name,
		steamID: obj_Server.steamID,
		lobbyMemberID: 0 })
	playerList[0].character = _inst
	playerList[0].startPos = _pos
	character = _inst}
	
alarm[0] = 2