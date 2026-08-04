function Input_script(_local){



if (hor != 0 or ver != 0)
{
	if (ver > 0) sprite_index = spr_charanoobD;
	else if (ver < 0) sprite_index = spr_charanoobU;
	else if (hor > 0) sprite_index = spr_charanoobR;
	else if (hor < 0) sprite_index = spr_charanoobL;
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
	if (sprite_index == spr_charanoobR) sprite_index = spr_charanoob_standR
	else if (sprite_index == spr_charanoobL) sprite_index = spr_charanoob_standL
	else if (sprite_index == spr_charanoobU) sprite_index = spr_charanoob_standU
	else if (sprite_index == spr_charanoobD) sprite_index = spr_charanoob_standD}
	
		

}

function inti_controls() {
	hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));}