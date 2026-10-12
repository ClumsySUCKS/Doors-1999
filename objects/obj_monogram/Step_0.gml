var _local_player = noone
with (obj_player) {
    if (isLocal) {_local_player = id}
}
if (_local_player != noone && point_distance(x, y, _local_player.x, _local_player.y) < 25) {
    if (keyboard_check_pressed(ord("E"))) {
        toggle_state()
        var _b = buffer_create(1, buffer_fixed, 1)
        buffer_write(_b, buffer_u8, NETWORK_PACKETS.MONOGRAM)
        if (instance_exists(obj_Server)) {
            for (var _i = 0; _i < array_length(obj_Server.playerList); _i++) {
                if (obj_Server.playerList[_i].steamID != obj_Server.steamID) {
                    net_packet_send(obj_Server.playerList[_i].steamID, _b)
                }
            }
        } else if (instance_exists(obj_Client)) {
            var lobbyHost = obj_player.lobbyHost
            net_packet_send(lobbyHost,_b)
        }
        
        buffer_delete(_b)
    }
}

if (on == false) {alarm[0] = 1000;}
		