function grab_spawn_point(_player) {
	var _spawnPoint  = instance_find(obj_SpawnPoint, _player)
	if _spawnPoint == noone return {x:0,y:0};
	return {x:_spawnPoint.x, y:_spawnPoint.y}
}

function send_player_input(_input,_lobby_host){
	var _xInput = (_input.rightKey - _input.leftKey)
	var _yInput = (_input.downKey - _input.upKey)
	var _b = buffer_create(5, buffer_fixed, 1); //1+1+1+1+1
	buffer_write(_b, buffer_u8, NETWORK_PACKETS.CLIENT_PLAYER_INPUT);//1
	buffer_write(_b, buffer_s8, _xInput);//1
	buffer_write(_b, buffer_s8, _yInput);//1
	steam_net_packet_send(_lobby_host, _b)
	buffer_delete(_b)
}


function receive_player_input(_b, _steam_id=-1){
	if _steam_id == -1 then _steam_id = buffer_read(_b, buffer_u64)
	var _xInput = buffer_read(_b, buffer_s8)
	var _yInput = buffer_read(_b, buffer_s8)
	var _runKey = buffer_read(_b, buffer_u8)
	var _actionKey = buffer_read(_b, buffer_u8)
	var _player = find_player_by_steam_id(_steam_id)
	if _player == noone return;
	_player.xInput = _xInput
	_player.yInput = _yInput

	
	return {steamID: _steam_id, xInput: _xInput, yInput: _yInput}
}

function find_player_by_steam_id(_steam_id){
	for (var _i = 0; _i < array_length(playerList); _i++){
		var _player = playerList[_i].character
		if _player == undefined continue;
		if _player.steamID == _steam_id return _player;
		
	}
	return noone;
}

function send_player_positions() {
	for (var _i = 0; _i < array_length(playerList); _i++){	
		var _player = playerList[_i]
		if _player.character == undefined then continue
		if _player.steamID == undefined then continue
		var _b = buffer_create(13, buffer_fixed, 1); //1+8+2+2
		buffer_write(_b, buffer_u8, NETWORK_PACKETS.PLAYER_POSITION);//1
		buffer_write(_b, buffer_u64, _player.steamID);//8
		buffer_write(_b, buffer_u16, _player.character.x);//2
		buffer_write(_b, buffer_u16, _player.character.y);//2
		buffer_write(_b, buffer_u16, _player.character.sprite_index)
		buffer_write(_b, buffer_u16,_player.character.image_index)
		for (var _k = 0; _k < array_length(playerList); _k++){
			if (playerList[_k].steamID != obj_Server.steamID) {
				steam_net_packet_send(playerList[_k].steamID, _b)	
			}
		}
		buffer_delete(_b)
		
		
	}
}

function update_player_position(_b) {
	var _steam_id = buffer_read(_b, buffer_u64)
	var _x = buffer_read(_b, buffer_u16)
	var _y = buffer_read(_b, buffer_u16)
	var _sprite_index = buffer_read(_b, buffer_u16)
	var _image_index = buffer_read(_b, buffer_u16)
	for (var _i = 0; _i < array_length(playerList); _i++){
		if (_steam_id == playerList[_i].steamID) {
			if playerList[_i].character = undefined then continue
			playerList[_i].character.x = _x	
			playerList[_i].character.y = _y
			playerList[_i].character.sprite_index = _sprite_index
			playerList[_i].character.image_index = _image_index
		}
	}
	
}