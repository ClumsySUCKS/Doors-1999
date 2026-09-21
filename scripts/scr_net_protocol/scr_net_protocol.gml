// ============================================================
// Script asset: scr_net_protocol
//
// Add this SAME script to BOTH projects (the relay AND your game).
// The numbers must match on both sides.
// ============================================================

// Game -> relay
enum C2S {
    CREATE_LOBBY = 1,   // string creator_name, u8 max_players
    JOIN_LOBBY   = 2,   // string code, string name
    LIST_LOBBIES = 3,   // (nothing)
    LEAVE_LOBBY  = 4,   // (nothing)
    RELAY        = 5,   // u16 to_id (NET_BROADCAST = everyone else in the lobby), then your packet
    PING         = 6    // (nothing) keep-alive
}

// Relay -> game
enum S2C {
    LOBBY_JOINED = 1,   // string code, u16 your_id, u16 host_id, u8 count, then per member: u16 id, string name
    JOIN_FAILED  = 2,   // u8 reason (see JOIN_ERR)
    PEER_JOINED  = 3,   // u16 id, string name
    PEER_LEFT    = 4,   // u16 id
    LOBBY_CLOSED = 5,   // (nothing) the host left, so the run is over
    LOBBY_LIST   = 6,   // u8 count, then per lobby: string code, string creator, u8 players, u8 limit
    DATA         = 7,   // u16 from_id, then your packet
    PONG         = 8    // (nothing)
}

enum JOIN_ERR {
    NOT_FOUND = 1,
    FULL = 2
}

#macro NET_PORT 6510
#macro NET_BROADCAST 65535
#macro NET_MAX_PAYLOAD 8192
