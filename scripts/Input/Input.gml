function Input_script(_local){
	if _local {



if (hor != 0 or ver != 0)
{
	if (ver > 0) sprite_index = spr_player_down;
	else if (ver < 0) sprite_index = spr_player_up;
	else if (hor > 0) sprite_index = spr_player_right;
	else if (hor < 0) sprite_index = spr_player_left;
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
	if (sprite_index == spr_player_right) sprite_index = spr_player_standr
	else if (sprite_index == spr_player_left) sprite_index = spr_player_standl
	else if (sprite_index == spr_player_up) sprite_index = spr_player_standu
	else if (sprite_index == spr_player_down) sprite_index = spr_player_standd}}
	
		

}

function inti_controls() {
	hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));}