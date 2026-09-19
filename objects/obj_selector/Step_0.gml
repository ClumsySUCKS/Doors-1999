switch room
{
	case rm_beginningmenu:
	spotx = [60, 157]
	spoty = [obj_act1_button.y - 18, obj_act2_button.y - 18]
	endspot = 1
	break
	case rm_hotelmenu:
	spotx = [16,106,206]
	spoty = [obj_hostbutton.y - 18, obj_joinbutton.y - 18, obj_skinbutton.y - 18]
	endspot = 2}
switch room {
	case rm_beginningmenu:
if keyboard_check_pressed(ord("A")) && canMove == true {
	spot = spot - 1
	audio_play_sound(snd_spot_change_menu,4,false)
	if spot < 0 {
		spot = endspot}
}
if keyboard_check_pressed(ord("D")) && canMove == true {
spot++
audio_play_sound(snd_spot_change_menu,4,false)
if spot > 1 {
	spot = 0}
}

x = spotx[spot]
y = spoty[spot]

if keyboard_check_pressed(ord("E")) && pressed == false {pressed = true
	image_speed = 1
	alarm[0] = 120}
	break
	case rm_hotelmenu:
if keyboard_check_pressed(ord("A")) && canMove == true {
	spot = spot - 1
	audio_play_sound(snd_spot_change_menu,4,false)
	if spot < 0 {
		spot = endspot}
}
if keyboard_check_pressed(ord("D")) && canMove == true {
spot++
audio_play_sound(snd_spot_change_menu,4,false)
if spot > 2 {
	spot = 0}
}

x = spotx[spot]
y = spoty[spot]

if keyboard_check_pressed(ord("E")) && pressed == false {pressed = true
	image_speed = 1
	with obj_hostbutton {image_speed = 1}
	alarm[0] = 120

}}