switch room {
	case rm_beginningmenu:
	switch spot {
		case 0: 
		room_goto(rm_hotelmenu)
		instance_destroy()
		break
		case 1:
		if global.act2 == true {
		}
		break}
	break
	case rm_hotelmenu:
	switch spot {
		case 0:
		with obj_hostbutton {
			selectAction()}
		break
		case 1:	
		with obj_joinbutton {
			selectAction()}
		break
		case 2:
		go = true
		alarm[1] = 60
		alarm[2] = 48
		break

}}







