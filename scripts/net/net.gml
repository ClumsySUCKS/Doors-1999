// ============================================================
// Script asset: net      (GAME project only)
//
// Replaces Steam networking with the relay server.
//
// Packet functions deliberately mirror Steam's names, so most of your code
// only needs   steam_net_packet_   ->   net_packet_
//
//   net_packet_send(to_id, buffer)      send what has been written to the buffer
//   net_packet_receive()                true while a packet is waiting
//   net_packet_get_sender_id()          who sent the current packet
//   net_packet_get_data(buffer)         copy the current packet into a buffer
//
// "IDs" are small numbers handed out by the relay. They take the place of
// Steam IDs, so keep using your steamID variables and just fill them with these.
//
// Lobby events reach your objects like Steam's async events did, but through
// a method: give any object   on_net_event = function(evt) { ... }   and it
// receives every event. evt.type is one of:
//   "lobby_joined"       code, my_id, host_id, is_host, members   (you created OR joined)
//   "lobby_join_failed"  reason (JOIN_ERR.NOT_FOUND / JOIN_ERR.FULL)
//   "lobby_list"         lobbies: array of { code, creator, players, limit }
//   "peer_joined"        pid, name
//   "peer_left"          pid
//   "lobby_closed"       (the host left)
//   "connect_failed"     (could not reach the relay)
//   "disconnected"       (lost the relay)
// ============================================================


// ---------------------------------------------------------------
// Setup / teardown  (call from obj_game)
// ---------------------------------------------------------------

function net_init() {
    if (variable_global_exists("net")) net_shutdown();

    // One line per relay server you rent. LOCAL = the relay running on your own PC.
    // The tag must match region_tag inside that relay project.
    global.net_regions = [
        { tag: "LOCAL", ip: "127.0.0.1" },
        // { tag: "US", ip: "YOUR.US.SERVER.IP" },
        // { tag: "AU", ip: "YOUR.SYDNEY.SERVER.IP" },
    ];
    global.net_region = global.net_regions[0].tag;   // region used for hosting and the lobby list

    global.player_name = "Player" + string(irandom_range(100, 999));   // TODO: replace with a name entry box

    global.net = {
        socket: -1,
        connecting: false,
        connected: false,
        tag: "",
        pending: undefined,     // what to do once the connection is up
        my_id: -1,
        host_id: -1,
        is_host: false,
        lobby_code: "",
        members: [],            // array of { pid, name }
        inbox: [],              // received game packets waiting to be read
        current: undefined,     // the packet net_packet_receive() is currently on
        out: buffer_create(1024, buffer_grow, 1),
        last_ping: 0,
        last_rx: 0
    };
}

function net_shutdown() {
    if (!variable_global_exists("net") || is_undefined(global.net)) return;
    var n = global.net;
    net_clear_inbox();
    if (n.socket >= 0) network_destroy(n.socket);
    if (buffer_exists(n.out)) buffer_delete(n.out);
    global.net = undefined;
}

// Keep-alive and dead-connection detection (call every step from obj_game)
function net_update() {
    if (is_undefined(global.net)) return;
    var n = global.net;
    if (!n.connected) return;

    if (current_time - n.last_ping > 10000) {
        n.last_ping = current_time;
        buffer_seek(n.out, buffer_seek_start, 0);
        buffer_write(n.out, buffer_u8, C2S.PING);
        network_send_packet(n.socket, n.out, 1);
    }

    if (current_time - n.last_rx > 30000) {
        show_debug_message("net: lost the connection to the relay");
        net_disconnect();
        net_dispatch({ type: "disconnected" });
    }
}


// ---------------------------------------------------------------
// Connecting
// ---------------------------------------------------------------

function net_region_ip(tag) {
    for (var i = 0; i < array_length(global.net_regions); i++) {
        if (global.net_regions[i].tag == tag) return global.net_regions[i].ip;
    }
    return "";
}

// Make sure we are connected to the relay for this region, then run 'job'
function net_connect(tag, job) {
    var n = global.net;
    var ip = net_region_ip(tag);
    if (ip == "") {
        show_debug_message("net: no server is set up for region " + tag);
        net_dispatch({ type: "connect_failed" });
        return;
    }

    // Already connected to the right place: do the job now
    if (n.connected && n.tag == tag) { net_run_pending(job); return; }

    // Already dialling the right place: just swap in the newest job
    if (n.connecting && n.tag == tag) { n.pending = job; return; }

    // Otherwise (re)connect
    net_disconnect();
    n.socket = network_create_socket(network_socket_tcp);
    n.tag = tag;
    n.connecting = true;
    n.pending = job;
    network_connect_async(n.socket, ip, NET_PORT);
}

function net_disconnect() {
    var n = global.net;
    if (n.socket >= 0) network_destroy(n.socket);
    n.socket = -1;
    n.connecting = false;
    n.connected = false;
    n.pending = undefined;
    n.tag = "";
    net_clear_lobby();
    net_clear_inbox();
}

function net_clear_lobby() {
    var n = global.net;
    n.my_id = -1;
    n.host_id = -1;
    n.is_host = false;
    n.lobby_code = "";
    n.members = [];
}

function net_clear_inbox() {
    var n = global.net;
    for (var i = 0; i < array_length(n.inbox); i++) {
        if (buffer_exists(n.inbox[i].data)) buffer_delete(n.inbox[i].data);
    }
    n.inbox = [];
    if (!is_undefined(n.current)) {
        if (buffer_exists(n.current.data)) buffer_delete(n.current.data);
        n.current = undefined;
    }
}

// Send the first message of a job (create / join / list)
function net_run_pending(job) {
    var n = global.net;
    buffer_seek(n.out, buffer_seek_start, 0);

    switch (job.kind) {
        case "create":
            buffer_write(n.out, buffer_u8, C2S.CREATE_LOBBY);
            buffer_write(n.out, buffer_string, job.name);
            buffer_write(n.out, buffer_u8, job.limit);
            break;
        case "join":
            buffer_write(n.out, buffer_u8, C2S.JOIN_LOBBY);
            buffer_write(n.out, buffer_string, job.code);
            buffer_write(n.out, buffer_string, job.name);
            break;
        case "list":
            buffer_write(n.out, buffer_u8, C2S.LIST_LOBBIES);
            break;
        default:
            return;
    }
    network_send_packet(n.socket, n.out, buffer_tell(n.out));
}


// ---------------------------------------------------------------
// Lobbies  (replace steam_lobby_create / steam_lobby_list_* / join)
// ---------------------------------------------------------------

function net_lobby_create(max_players) {
    net_connect(global.net_region, { kind: "create", name: global.player_name, limit: max_players });
}

function net_lobby_list() {
    net_connect(global.net_region, { kind: "list" });
}

// The region is read from the code, e.g. "AU-K7QF" connects to the "AU" server
function net_lobby_join(code) {
    code = string_upper(code);
    var dash = string_pos("-", code);
    var tag = (dash > 1) ? string_copy(code, 1, dash - 1) : global.net_region;
    net_connect(tag, { kind: "join", code: code, name: global.player_name });
}

function net_lobby_leave() {
    var n = global.net;
    if (n.connected && n.lobby_code != "") {
        buffer_seek(n.out, buffer_seek_start, 0);
        buffer_write(n.out, buffer_u8, C2S.LEAVE_LOBBY);
        network_send_packet(n.socket, n.out, 1);
    }
    net_clear_lobby();
    net_clear_inbox();
}

function net_my_id()      { return global.net.my_id; }
function net_host_id()    { return global.net.host_id; }
function net_is_host()    { return global.net.is_host; }
function net_lobby_code() { return global.net.lobby_code; }

function net_peer_name(pid) {
    var m = global.net.members;
    for (var i = 0; i < array_length(m); i++) {
        if (m[i].pid == pid) return m[i].name;
    }
    return "Player";
}


// ---------------------------------------------------------------
// Game packets  (replace steam_net_packet_*)
// ---------------------------------------------------------------

// Sends bytes 0 .. buffer_tell(buff). Pass NET_BROADCAST as to_id to reach everyone else.
function net_packet_send(to_id, buff, size = undefined) {
    var n = global.net;
    if (!n.connected || n.lobby_code == "") return false;
    if (is_undefined(size)) size = buffer_tell(buff);
    if (size <= 0 || size > NET_MAX_PAYLOAD) return false;

    var out = n.out;
    if (buffer_get_size(out) < size + 3) buffer_resize(out, size + 3);
    buffer_seek(out, buffer_seek_start, 0);
    buffer_write(out, buffer_u8, C2S.RELAY);
    buffer_write(out, buffer_u16, to_id);
    buffer_copy(buff, 0, size, out, 3);
    network_send_packet(n.socket, out, size + 3);
    return true;
}

// Moves to the next waiting packet. Use exactly like steam_net_packet_receive().
function net_packet_receive() {
    var n = global.net;
    if (!is_undefined(n.current)) {
        if (buffer_exists(n.current.data)) buffer_delete(n.current.data);
        n.current = undefined;
    }
    if (array_length(n.inbox) == 0) return false;
    n.current = n.inbox[0];
    array_delete(n.inbox, 0, 1);
    return true;
}

function net_packet_get_sender_id() {
    var c = global.net.current;
    return is_undefined(c) ? -1 : c.from;
}

// Copies the current packet into 'dest' and rewinds it to the start.
// The rest of the buffer is zeroed so stale bytes from an earlier, longer packet
// can never be read by mistake.
function net_packet_get_data(dest) {
    var c = global.net.current;
    if (is_undefined(c)) return false;
    if (buffer_get_size(dest) < c.size) buffer_resize(dest, c.size);
    buffer_fill(dest, 0, buffer_u8, 0, buffer_get_size(dest));
    buffer_copy(c.data, 0, c.size, dest, 0);
    buffer_seek(dest, buffer_seek_start, 0);
    return true;
}


// ---------------------------------------------------------------
// Incoming traffic  (call from obj_game's Async - Networking event)
// ---------------------------------------------------------------

function net_handle_async() {
    if (is_undefined(global.net)) return;
    var n = global.net;
    if (n.socket < 0) return;

    var type = async_load[? "type"];

    switch (type) {
        case network_type_non_blocking_connect:
            n.connecting = false;
            if (async_load[? "succeeded"]) {
                n.connected = true;
                n.last_rx = current_time;
                n.last_ping = current_time;
                if (!is_undefined(n.pending)) {
                    var job = n.pending;
                    n.pending = undefined;
                    net_run_pending(job);
                }
            } else {
                show_debug_message("net: could not reach the relay for region " + n.tag);
                net_disconnect();
                net_dispatch({ type: "connect_failed" });
            }
            break;

        case network_type_disconnect:
            var gone_sock = async_load[? "socket"];
            if (!is_undefined(gone_sock) && gone_sock != n.socket) break;   // an old socket, ignore
            show_debug_message("net: the relay closed the connection");
            net_disconnect();
            net_dispatch({ type: "disconnected" });
            break;

        case network_type_data:
            n.last_rx = current_time;
            net_handle_message(async_load[? "buffer"], async_load[? "size"]);
            break;
    }
}

function net_handle_message(buff, size) {
    var n = global.net;
    buffer_seek(buff, buffer_seek_start, 0);
    var msg = buffer_read(buff, buffer_u8);

    switch (msg) {
        case S2C.LOBBY_JOINED:
            n.lobby_code = buffer_read(buff, buffer_string);
            n.my_id = buffer_read(buff, buffer_u16);
            n.host_id = buffer_read(buff, buffer_u16);
            n.is_host = (n.my_id == n.host_id);
            n.members = [];
            var member_count = buffer_read(buff, buffer_u8);
            repeat (member_count) {
                var member_id = buffer_read(buff, buffer_u16);
                var member_name = buffer_read(buff, buffer_string);
                array_push(n.members, { pid: member_id, name: member_name });
            }
            net_clear_inbox();
            net_dispatch({
                type: "lobby_joined", code: n.lobby_code, my_id: n.my_id,
                host_id: n.host_id, is_host: n.is_host, members: n.members
            });
            break;

        case S2C.JOIN_FAILED:
            var reason = buffer_read(buff, buffer_u8);
            net_dispatch({ type: "lobby_join_failed", reason: reason });
            break;

        case S2C.PEER_JOINED:
            var joined_id = buffer_read(buff, buffer_u16);
            var joined_name = buffer_read(buff, buffer_string);
            array_push(n.members, { pid: joined_id, name: joined_name });
            net_dispatch({ type: "peer_joined", pid: joined_id, name: joined_name });
            break;

        case S2C.PEER_LEFT:
            var left_id = buffer_read(buff, buffer_u16);
            for (var i = array_length(n.members) - 1; i >= 0; i--) {
                if (n.members[i].pid == left_id) array_delete(n.members, i, 1);
            }
            net_dispatch({ type: "peer_left", pid: left_id });
            break;

        case S2C.LOBBY_CLOSED:
            net_clear_lobby();
            net_clear_inbox();
            net_dispatch({ type: "lobby_closed" });
            break;

        case S2C.LOBBY_LIST:
            var found = [];
            var list_count = buffer_read(buff, buffer_u8);
            repeat (list_count) {
                var l_code = buffer_read(buff, buffer_string);
                var l_creator = buffer_read(buff, buffer_string);
                var l_players = buffer_read(buff, buffer_u8);
                var l_limit = buffer_read(buff, buffer_u8);
                array_push(found, { code: l_code, creator: l_creator, players: l_players, limit: l_limit });
            }
            net_dispatch({ type: "lobby_list", lobbies: found });
            break;

        case S2C.DATA:
            var from_id = buffer_read(buff, buffer_u16);
            var payload_size = size - 3;
            if (payload_size > 0) {
                var pbuf = buffer_create(payload_size, buffer_fixed, 1);
                buffer_copy(buff, 3, payload_size, pbuf, 0);
                array_push(n.inbox, { from: from_id, data: pbuf, size: payload_size });
                if (array_length(n.inbox) > 1000) {   // nobody is reading: drop the oldest
                    buffer_delete(n.inbox[0].data);
                    array_delete(n.inbox, 0, 1);
                }
            }
            break;

        case S2C.PONG:
            break;
    }
}

// Hand an event to every instance that has an on_net_event method
function net_dispatch(evt) {
    var e = evt;
    with (all) {
        if (variable_instance_exists(id, "on_net_event")) {
            on_net_event(e);
        }
    }
}
