	/// @description Init Client Variables

	
playerList = []

steamID = net_my_id()
steamName = global.player_name
lobbyMemberID = undefined
lobbyHost = net_host_id()
character = undefined

inbuf = buffer_create(16, buffer_grow, 1);

playerList[0] = {
	steamID		: steamID,
	steamName	: steamName,
	character	: undefined,
	startPos	: grab_spawn_point(0),
	lobbyMemberID : undefined
	}
	
on_net_event = function (evt) {
	if (evt.type == "lobby_joined") {
		steamID = evt.my_id
        lobbyHost = evt.host_id	
		playerList[0].steamID = evt.my_id}
	if (evt.type == "lobby_closed" || evt.type == "disconnected") {
		show_debug_message("Host left or connection lost")
		game_restart()}}