function get_controls(_is_host, _is_local)
{
	if (_is_host && _is_local) {
	//Directions inputs
hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

	allDir = rightKey+leftKey+downKey+upKey
	xInput = hor
	yInput = ver
	if (hor != 0 or ver != 0)
{
	if (ver > 0) sprite_index = playerdownsprites[lobbyMemberID];
	else if (ver < 0) sprite_index = playerupsprites[lobbyMemberID];
	else if (hor > 0) sprite_index = playerrightsprites[lobbyMemberID];
	else if (hor < 0) sprite_index = playerleftsprites[lobbyMemberID];
	if walk_timer < 23 {
    walk_timer = walk_timer + 1
}
else {
	if sa == false
		{ walk_timer=0;
		 audio_play_sound(walk1,20,0)
		 sa = true}
		 
	if sa == true
	{
		walk_timer = 0
		audio_play_sound(walk2,20,0)
		sa = false
	}
    }
}

else
{
	if (sprite_index == playerrightsprites[lobbyMemberID]) sprite_index = playerrightstandsprites[lobbyMemberID]
	else if (sprite_index == playerleftsprites[lobbyMemberID]) sprite_index = playerleftstandsprites[lobbyMemberID]
	else if (sprite_index == playerupsprites[lobbyMemberID]) sprite_index = playerupstandsprites[lobbyMemberID]
	else if (sprite_index == playerdownsprites[lobbyMemberID]) sprite_index = playerdownstandsprites[lobbyMemberID]}}
	
	
	//Send Host Input to Clients
	var _input = {steamID: lobbyHost, xInput:xInput, yInput:yInput}
	send_player_input_to_clients(_input)
	
	
	if (!_is_host && _is_local) {
	//Directions inputs
	var _rightKey = keyboard_check(vk_right) ||keyboard_check(ord("D")) || gamepad_button_check( 0, gp_padr );
	var _leftKey  = keyboard_check(vk_left) || keyboard_check(ord("A")) || gamepad_button_check( 0, gp_padl );
	var _downKey  = keyboard_check(vk_down) || keyboard_check(ord("S")) || gamepad_button_check( 0, gp_padd );
	var _upKey  = keyboard_check(vk_up) || keyboard_check(ord("W")) || gamepad_button_check( 0, gp_padu );
	

	//Send input to Server
	var _input = {rightKey:_rightKey, leftKey:_leftKey, downKey:_downKey, upKey:_upKey}
	send_player_input(_input,lobbyHost);
	}

}
function init_controls(){
	//Directions inputs
	rightKey	= 0
	leftKey		= 0
	downKey		= 0
	upKey		= 0
	
	xInput = 0
	yInput = 0


}