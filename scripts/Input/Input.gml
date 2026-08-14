function get_controls(_is_host, _is_local)
{
	if (_is_host && _is_local) {
	//Directions inputs
	hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

	xInput = hor
	yInput = ver
<<<<<<< HEAD
<<<<<<< HEAD
	
	actionKey = keyboard_check(ord("E"))
=======
>>>>>>> parent of a1910d8 (i could fuck things with this)
=======
>>>>>>> parent of a1910d8 (i could fuck things with this)


	
	//Send Host Input to Clients
	var _input = {steamID: lobbyHost, xInput:xInput, yInput:yInput}
	send_player_input_to_clients(_input)
	}
	
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