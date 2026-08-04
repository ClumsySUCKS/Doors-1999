	///@self obj_server
function send_player_sync(_steam_id){
	_b = buffer_create(1,buffer_grow,1)
	buffer_write(_b,buffer_u8, NETWORK_PACKETS.SYNC_PLAYERS)
	buffer_write(_b, buffer_string, shrink_player_list())
	steam_net_packet_send(_steam_id,_b)
	buffer_delete(_b)
}

///@self obj_server
function send_player_spawn(_steam_id, _slot){
	_pos =	grab_spawn_point(_slot)
	_b = buffer_create(5, buffer_fixed,1)
	buffer_write(_b, buffer_u8, NETWORK_PACKETS.SPAWN_SELF)
	buffer_write(_b, buffer_u16,_pos.x)
	buffer_write(_b, buffer_u16,_pos.y)
	steam_net_packet_send(_steam_id,_b)
	buffer_delete(_b)
	server_player_spawn_at_pos(_steam_id, _pos)
	send_other_player_spawn(_steam_id, _pos)
	
	
	///@self obj_server
function send_other_player_spawn(_steam_id, _pos) {
	_b = buffer_create(13, buffer_fixed, 1)
	buffer_write(_b, buffer_u8, NETWORK_PACKETS.SPAWN_OTHER)
	buffer_write(_b, buffer_u16, _pos.x)
	buffer_write(_b, buffer_u16, _pos.y)
	buffer_write(_b, buffer_u64, _steam_id)
	for (var _i = 1; _i < array_length(playerList); _i++) {
		if playerList[_i].steamID != _steam_id {
			steam_net_packet_send(playerList[_i].steamID,_b)
		}}
		
		buffer_delete(_b)
		}
	
}
var list = [];

for (var i = 0; i < array_length(playerList); i++)
{
    array_push(list,
    {
        steamID : playerList[i].steamID,
        steamName : playerList[i].steamName,
        lobbyMemberID : playerList[i].lobbyMemberID,
        startPos : playerList[i].startPos
    });
}

return json_stringify(list);

function server_player_spawn_at_pos(_steam_id, _pos){
	_layer = layer_get_id("Player")
	
	for (var _i = 0; _i < array_length(playerList); _i++){
		if playerList[_i].steamID == _steam_id {
			var _inst = instance_create_layer(_pos.x,_pos.y,_layer,obj_player, {
				steamName : playerList[_i].steamName,
				steamID : _steam_id,
				lobbyMemberID : _i})
	playerList[_i].character = _inst
		}}
}

