function get_forward_door(){
	if (instance_exists(doorexit)) return doorexit
	if (instance_exists(doorexitb)) return doorexitb
	if (instance_exists(doorexitr)) return doorexitr
	if (instance_exists(doorexity)) return doorexity
	if (instance_exists(doorexit_locked)) return doorexit_locked
	if (instance_exists(sidexitL)) return sidexitL
	if (instance_exists(sidexitR)) return sidexitR
	return noone

}

function enter_new_room(_door_index, _going_forward) {
	var _marker = _going_forward ? get_forward_door() : (instance_exists(doorstart) ? doorstart : noone)
	var _mx = (_marker != noone) ? _marker.x : 0
	var _my = (_marker != noone) ? _marker.y : 0
	instance_destroy(obj_SpawnPoint)
	instance_create_layer(_mx,_my,"Instances",obj_SpawnPoint)
	global.doorcount = _door_index
	go_to_room(_door_index)}
	
function respawn_other_players() {
	var _owner = instance_exists(obj_Server) ? obj_Server : (instance_exists(obj_Client) ? obj_Client : noone)
	if _owner == noone return
	var _layer = layer_get_id("Player")
	for (var _i = 0; _i < array_length(_owner.playerList); _i++) {
		var _p = _owner.playerList[_i]
		if (_p.steamID == _owner.steamID) continue
		var _pos = grab_spawn_point(0)
		var _inst = instance_create_layer(_pos.x,_pos.y,_layer, obj_player, {
			steamName: _p.steamName,
			steamID : _p.steamID,
			lobbyMemberID : _p.lobbyMemberID})
		_owner.playerList[_i].character = _inst}}
		
function send_gather_status(_forward, _is_near) {
	if net_is_host() {
		host_receive_gather(net_my_id(), _forward, _is_near) return}
		var _b = buffer_create(3,buffer_fixed,1)
		buffer_write(_b, buffer_u8, NETWORK_PACKETS.DOOR_GATHER)
		buffer_write(_b, buffer_u8, _forward)
		buffer_write(_b, buffer_u8, _is_near)
		net_packet_send(net_host_id(), _b)
		buffer_delete(_b)}
	
function host_receive_gather(_steam_id, _forward, _near) {
	if !instance_exists(doorcontroller) return
	with doorcontroller {
		var _entry = ds_map_exists(door_gather_state, _steam_id) ? door_gather_state[? _steam_id] : {forward:false, backward:false}
		if _forward {_entry.forward = _near} else {_entry.backward = _near}
		door_gather_state[? _steam_id] = _entry}}

function host_update_gather_timer() {
	if !instance_exists(obj_Server) ||	!instance_exists(doorcontroller) return
	var _total = array_length(obj_Server.playerList)
	if _total <= 0 return
	
	var _all_forward = true, _any_forward = false
	var _all_backward = true, _any_backward = false
	with doorcontroller {
		for (var _i = 0; _i < _total; _i++) {
			var _sid = obj_Server.playerList[_i].steamID
			var _entry = ds_map_exists(door_gather_state, _sid) ? door_gather_state[? _sid] : {forward:false, backward:false}
			if _entry.forward {_any_forward = true} else {_all_forward = false}
			if _entry.backward {_any_backward = true} else {_all_backward = false}}
			global.gather_timer_display = gather_timer
			if _any_forward || _all_backward {
				if gather_timer < 0 {gather_timer = GATHER_TIMEOUT}
				gather_timer -= (1000/room_speed)} else {
					gather_timer = -1}
			static _last_sent = -999
			if (abs(gather_timer - _last_sent) > 100 || (gather_timer < 0) != (_last_sent < 0)) {
				_last_sent = gather_timer
				var _b = buffer_create(5, buffer_fixed, 1)
				buffer_write(_b, buffer_u8, NETWORK_PACKETS.DOOR_GATHER)
				buffer_write(_b, buffer_u8, 255)
				buffer_write(_b, buffer_u32, gather_timer)
				with (obj_Server) {
					for (var _i = 0; _i < array_length(playerList); _i++) {
						if (playerList[_i].steamID != steamID) {net_packet_send(playerList[_i].steamID, _b)}}}
						buffer_delete(_b)}
					
			var _timed_out = (gather_timer >= 0 && gather_timer <= 0)
			var _go_forward = _all_forward || (_timed_out && _any_forward)
			var _go_backward = !_go_forward && (_all_backward || (_timed_out && _any_backward))
			
			if (_go_forward) {with (obj_Server) {door_transition(1)}}
			else if (_go_backward) {with obj_Server {door_transition(-1)}}}}
	