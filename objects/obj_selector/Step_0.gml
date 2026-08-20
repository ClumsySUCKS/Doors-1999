switch room {
	case rm_beginningmenu:
if keyboard_check_pressed(ord("A")) {
	spot = spot - 1
	if spot < 0 {
		spot = endspot}
}
if keyboard_check_pressed(ord("D")) {
spot++
if spot > 1 {
	spot = 0}
}

x = spotx[spot]
y = 109

if keyboard_check_pressed(ord("E")) && pressed == false {pressed = true
	image_speed = 1
	alarm[0] = 120}
}
	