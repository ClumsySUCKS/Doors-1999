

	var _playerLayer = layer_get_id("Player")

	for (var _player = 0; _player < array_length(playerList); _player++) {
		var _pos = grab_spawn_point(_player)
		var _spr_index = get_sprite_index(_player)
		var _inst = instance_create_layer(_pos.x,_pos.y,_playerLayer,obj_player,
									{
										steamName	: playerList[_player].steamName,
										steamID: playerList[_player].steamID,
										lobbyMemberID: playerList[_player].lobbyMemberID
									})
		playerList[_player].character = _inst
		playerList[_player].startPos = _pos
		if (playerList[_player].steamID == steamID) then character = _inst
		character.sprite_index = _spr_index
	}

	alarm[0] = 5