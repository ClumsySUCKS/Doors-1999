

_playerLayer = layer_get_id("Player")

for (var _player = 0; _player < array_length(playerList); _player++) {
	_pos = grab_spawn_point(_player)
	_inst = instance_create_layer(_pos.x,_pos.y, _playerLayer, obj_player, {
		steamName : playerList[_player].steamName,
		steamID : playerList[_player].steamID,
		lobbyMemberID : playerList[_player].lobbyMemberID
		
	})
	playerList[_player].character = _inst
	playerList[_player].startPos = _pos
	if playerList[_player].steamID == steamID then character = _inst
	
	}