	///@self obj_server
function send_player_sync(_steam_id){
	var _b = buffer_create(1, buffer_grow, 1);
	buffer_write(_b, buffer_u8, NETWORK_PACKETS.SYNC_PLAYERS);
	buffer_write(_b, buffer_string, shrink_player_list());
	net_packet_send(_steam_id, _b)
	buffer_delete(_b);
}

///@self obj_server
function send_player_spawn(_steam_id, _slot) {
	var _pos = grab_spawn_point(_slot)
	var _b = buffer_create(11, buffer_fixed, 1); //1+2+2
	buffer_write(_b, buffer_u8, NETWORK_PACKETS.SPAWN_SELF);//1
	buffer_write(_b, buffer_u16, _pos.x);//2
	buffer_write(_b, buffer_u16, _pos.y);//2
	buffer_write(_b, buffer_u16, _slot)
	buffer_write(_b, buffer_u32, global.room_seed)
	net_packet_send(_steam_id, _b)
	buffer_delete(_b);
	server_player_spawn_at_pos(_steam_id, _pos)
	send_other_player_spawn(_steam_id, _pos);
}
	
	
	///@self obj_server
function send_other_player_spawn(_steam_id, _pos) {
	var _b = buffer_create(13, buffer_fixed, 1); //1+2+2+8
	buffer_write(_b, buffer_u8, NETWORK_PACKETS.SPAWN_OTHER);//1
	buffer_write(_b, buffer_u16, _pos.x);//2
	buffer_write(_b, buffer_u16, _pos.y);//2
	buffer_write(_b, buffer_u64, _steam_id);//8
	for (var _i = 1; _i < array_length(playerList); _i++){
		if (playerList[_i].steamID != _steam_id) {
			net_packet_send(playerList[_i].steamID, _b)
		}
	}
	buffer_delete(_b);
}
/// @self obj_server
function shrink_player_list(){
	//_shrunkList = playerList
	//for (var _i = 0; _i < array_length(_shrunkList); _i++) {
	//	_shrunkList[_i].character = undefined
	//}
	return json_stringify(playerList)
}

function server_player_spawn_at_pos(_steam_id, _pos) {
	var _layer = layer_get_id("Player");
	for (var _i = 0; _i < array_length(playerList); _i++){
		if playerList[_i].steamID == _steam_id {
			var _inst = instance_create_layer(_pos.x, _pos.y,_layer,obj_player, {
								steamName	: playerList[_i].steamName,
								steamID: _steam_id,
								lobbyMemberID: _i
						})
			playerList[_i].character = _inst
		}
	}
}

function send_player_input_to_clients(_player_input){
	if _player_input == undefined then return
	var _b = buffer_create(13, buffer_fixed, 1); //1+8+1+1+1+1
	buffer_write(_b, buffer_u8, NETWORK_PACKETS.SERVER_PLAYER_INPUT);//1
	buffer_write(_b, buffer_u64, _player_input.steamID);//8
	buffer_write(_b, buffer_s8, _player_input.xInput);//1
	buffer_write(_b, buffer_s8, _player_input.yInput);//1
	buffer_write(_b, buffer_u8, _player_input.interactKey);
	for (var _i = 0; _i < array_length(obj_Server.playerList); _i++){
		if (obj_Server.playerList[_i].steamID != obj_Server.steamID) {
			net_packet_send(obj_Server.playerList[_i].steamID, _b)
		}
	}
	buffer_delete(_b);
}

///@self obj_server
function door_transition(_direction) {
	global.doorcount += _direction
	global.doorcountdiscord += _direction
	if global.doorcount == 13 {
		global.doorcount += _direction
		global.doorcountdiscord += _direction}
	
		var _new_index = global.doorcount
	
	var _b = buffer_create(3, buffer_fixed, 1)
	buffer_write(_b, buffer_u8, NETWORK_PACKETS.ROOM_CHANGE)
	buffer_write(_b, buffer_u16, _new_index)
	for (var _i; _i < array_length(playerList); _i++) {
		if playerList[_i].steamID != steamID {net_packet_send(playerList[_i].steamID, _b)}}
		buffer_delete(_b)
		enter_new_room(_new_index, _direction > 0)}
		
