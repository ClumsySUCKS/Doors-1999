switch room
{
	case rm_beginningmenu:
	spotx = [60, 157]
	spoty = [obj_act1_button.y - 18, obj_act2_button.y - 18]
	endspot = 1
	break}
switch room {
	case rm_beginningmenu:
if keyboard_check_pressed(ord("A")) && canMove == true {
	spot = spot - 1
	if spot < 0 {
		spot = endspot}
}
if keyboard_check_pressed(ord("D")) && canMove == true {
spot++
if spot > 1 {
	spot = 0}
}

x = spotx[spot]
y = spoty[spot]

if keyboard_check_pressed(ord("E")) && pressed == false {pressed = true
	image_speed = 1
	alarm[0] = 120}
}
