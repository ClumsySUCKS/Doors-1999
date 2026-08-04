/// @description Listening for activity as client

// obj_client: BEGIN STEP
while(steam_net_packet_receive()) {
    _sender = steam_net_packet_get_sender_id()
    steam_net_packet_get_data(inbuf)
    buffer_seek(inbuf, buffer_seek_start, 0)
    _type = buffer_read(inbuf, buffer_u8)
    
    switch _type {
        case NETWORK_PACKETS.SYNC_PLAYERS:
            var _str = buffer_read(inbuf, buffer_string);
            var _parsed = json_parse(_str);
            sync_players(_parsed);
            break;
            
        case NETWORK_PACKETS.SPAWN_OTHER:
            var _x = buffer_read(inbuf, buffer_u16);
            var _y = buffer_read(inbuf, buffer_u16);
            var _otherID = buffer_read(inbuf, buffer_u64);
            var _layer = layer_get_id("Player");
            
            // Check if player instance already exists
            var _already_exists = false;
            for (var i = 0; i < array_length(playerList); i++) {
                if (playerList[i].steamID == _otherID && instance_exists(playerList[i].character)) {
                    _already_exists = true;
                    break;
                }
            }
            
            if (!_already_exists) {
                var _inst = instance_create_layer(_x, _y, _layer, obj_player, {
                    steamName: steam_get_user_persona_name(_otherID),
                    steamID: _otherID,
                    lobbyMemberID: array_length(playerList)
                });
                
                array_push(playerList, {
                    steamID: _otherID,
                    steamName: steam_get_user_persona_name(_otherID),
                    character: _inst,
                    lobbyMemberID: array_length(playerList)
                });
            }
            break;
            
        case NETWORK_PACKETS.SPAWN_SELF:
            var _x = buffer_read(inbuf, buffer_u16);
            var _y = buffer_read(inbuf, buffer_u16);
            var _layer = layer_get_id("Player");
            
            if (character == undefined || !instance_exists(character)) {
                var _inst = instance_create_layer(_x, _y, _layer, obj_player, {
                    steamName: steamName,
                    steamID: steamID,
                    lobbyMemberID: 0
                });
                playerList[0].character = _inst;
                character = _inst;
            }
            break;
            
        default:
            show_debug_message("Unknown packet received");
            break;
    }
}

