/// @self obj_client
function sync_players(_new_list) {
	_steamIDs = []
	for (var _i = 0; _i < array_length(playerList); _i++) {
		array_push(_steamIDs, playerList[_i].steamID)
	}
	
	for (var _i = 0; _i < array_length(_new_list); _i++) {
		_newSteamID = _new_list[_i].steamID
		if !array_contains(_steamIDs, _newSteamID) {
			_inst = client_player_spawn_at_pos(_new_list[_i])
			_new_list[_i].character = _inst
			array_push(playerList, _new_list[_i])}
			else {
				for (var _k = 0; _k < array_length(playerList); _k++){
					if playerList[_k].steamID == _newSteamID {
						playerList[_k].startPos = _new_list[_i].startPos
						playerList[_k].lobbyMemberID = _new_list[_i].lobbyMemberID
						if playerList[_k].character == undefined && playerList[_k].steamID != _newSteamID {
							_inst = client_player_spawn_at_pos(playerList[_k])
							playerList[_k].character = _inst
							
}}}}}}

///@self obj_client
function client_player_spawn_at_pos(_player_info){
	_layer = layer_get_id("Player")
	_name = _player_info.steamName
	_steamID = _player_info.steamID
	_num = _player_info.lobbyMemberID	
	_loc = _player_info.startPos
	_inst =	instance_create_layer(_loc.x,_loc.y,_layer,obj_player, {
		steamName : _name,
		steamID : _steamID,
		lobbyMemberID : _num
	})
 return _inst	
}
	
	