/// @description Listening for activity as client

while(net_packet_receive()){
	
	var _sender = net_packet_get_sender_id();
	net_packet_get_data(inbuf);
	buffer_seek(inbuf, buffer_seek_start, 0);
	var _type = buffer_read(inbuf, buffer_u8);
	
	switch _type{
		case NETWORK_PACKETS.SYNC_PLAYERS:
			var _playerList = buffer_read(inbuf, buffer_string);
			_playerList = json_parse(_playerList)
			sync_players(_playerList)
			break
		case NETWORK_PACKETS.SPAWN_OTHER:
			var _layer = layer_get_id("Player");
			var _x = buffer_read(inbuf, buffer_u16)
			var _y = buffer_read(inbuf, buffer_u16)
			var _steamID = buffer_read(inbuf, buffer_u64)
			var _num = array_length(playerList)
			var _inst = instance_create_layer(_x,_y,_layer,obj_player,{
							steamName : net_peer_name(steamID),
							steamID : _steamID,
							lobbyMemberID : _num
							})
			show_debug_message("SPAWN_OTHER handled, created instance " + string(_inst))
			array_push(playerList, {
				steamID	 : _steamID,
				steamName: net_peer_name(_steamID),
				character: _inst,
				lobbyMemberID : _num
			})
			break
			
		case NETWORK_PACKETS.SPAWN_SELF:
			var _layer = layer_get_id("Player");
			var _x = buffer_read(inbuf, buffer_u16)
			var _y = buffer_read(inbuf, buffer_u16)
			lobbyMemberID = buffer_read(inbuf, buffer_u16)
			global.room_seed = buffer_read(inbuf, buffer_u32)	
			var _inst = instance_create_layer(_x,_y,_layer,obj_player,{
							steamName	: steamName,
							steamID: steamID,
							lobbyMemberID: lobbyMemberID
						})
			show_debug_message("SPAWN_SELF handled, created instance " + string(_inst))
			with _inst {
				alarm[0] = 100
				instance_create_layer(0,0,"trans",obj_dark)}
			playerList[0].character = _inst
			playerList[0].lobbyMemberID = lobbyMemberID
			character = _inst
			break

		case NETWORK_PACKETS.SERVER_PLAYER_INPUT:
			receive_player_input(inbuf)
			break
			
		case NETWORK_PACKETS.PLAYER_POSITION:
			update_player_position(inbuf)
			break
		case NETWORK_PACKETS.MONOGRAM:
			// Client receives this from the server
			if (instance_exists(obj_monogram)) {
				with (obj_monogram) { toggle_state(); }
			}
			break;
		case NETWORK_PACKETS.ROOM_CHANGE:
		var _new_index = buffer_read(inbuf, buffer_u16)
		var _going_forward = (_new_index > global.doorcount)
		enter_new_room(_new_index, _going_forward)
		break
		default:
			show_debug_message("Unknown packet received: "+string(_type))
			break
		case NETWORK_PACKETS.DOOR_GATHER:
		var _flag = buffer_read(inbuf, buffer_u8)
		if (_flag == 255) {global.gather_timer_display = buffer_read(inbuf, buffer_s32)}
		break
	}
}

