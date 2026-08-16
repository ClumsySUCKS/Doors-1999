while(steam_net_packet_receive()){
	
	var _sender = steam_net_packet_get_sender_id();
	steam_net_packet_get_data(inbuf);
	buffer_seek(inbuf, buffer_seek_start, 0);
	var _type = buffer_read(inbuf, buffer_u8);
	
	switch _type{
		case NETWORK_PACKETS.CLIENT_PLAYER_INPUT:
			var _playerInput = receive_player_input(inbuf, _sender);
			send_player_input_to_clients(_playerInput);
			break
		case NETWORK_PACKETS.MONOGRAM:
			// Server receives this from a client
			if (instance_exists(obj_monogram)) {
				with (obj_monogram) { toggle_state(); }
			}
			
			// Bounce this packet to all OTHER clients so they see it too
			var _b = buffer_create(1, buffer_fixed, 1);
			buffer_write(_b, buffer_u8, NETWORK_PACKETS.MONOGRAM);
			for (var _i = 0; _i < array_length(playerList); _i++){
				if (playerList[_i].steamID != steamID && playerList[_i].steamID != _sender) {
					steam_net_packet_send(playerList[_i].steamID, _b);
				}
			}
			buffer_delete(_b);
			break;
		default:
			show_debug_message("Unknown packet received: "+string(_type))
			break
	}
	
}