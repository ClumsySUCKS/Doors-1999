enum C2S {
    CREATE_LOBBY = 1,   
    JOIN_LOBBY   = 2,   
    LIST_LOBBIES = 3,   
    LEAVE_LOBBY  = 4,   
    RELAY        = 5,  
    PING         = 6    
}


enum S2C {
    LOBBY_JOINED = 1,   
    JOIN_FAILED  = 2,   
    PEER_JOINED  = 3,  
    PEER_LEFT    = 4,   
    LOBBY_CLOSED = 5,   
    LOBBY_LIST   = 6,   
    DATA         = 7,   
    PONG         = 8    
}

enum JOIN_ERR {
    NOT_FOUND = 1,
    FULL = 2
}

#macro NET_PORT 6510
#macro NET_BROADCAST 65535
#macro NET_MAX_PAYLOAD 8192
