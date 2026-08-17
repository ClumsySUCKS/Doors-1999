var _local_player = noone;
with (obj_player) {
    if (isLocal) { _local_player = id; }
}

// Check distance against the local player instead of just "obj_player"
if (_local_player != noone && point_distance(x, y, _local_player.x, _local_player.y) < 25) {
    if (keyboard_check_pressed(ord("E"))) {
        
        // 1. Toggle the monogram locally
        toggle_state();

        // 2. Send a packet so the other player sees/hears it too
        var _b = buffer_create(1, buffer_fixed, 1);
        buffer_write(_b, buffer_u8, NETWORK_PACKETS.MONOGRAM);
        
        if (instance_exists(obj_Server)) {
            // If I am the host, send this to all connected clients
            for (var _i = 0; _i < array_length(obj_Server.playerList); _i++) {
                if (obj_Server.playerList[_i].steamID != obj_Server.steamID) {
                    steam_net_packet_send(obj_Server.playerList[_i].steamID, _b);
                }
            }
        } else if (instance_exists(obj_Client)) {
            var lobbyHost = obj_player.lobbyHost
            steam_net_packet_send(lobbyHost,_b);
        }
        
        buffer_delete(_b);
    }
}

if (on == false) { alarm[0] = 1000; }
		