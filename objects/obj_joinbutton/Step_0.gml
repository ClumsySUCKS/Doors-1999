switch floor(image_index) {
	case 0:
	image_speed = 1
	break
	case 9:
	image_speed = 10
	break
	case 14:
	image_speed = 1.5
	break
	case 16:
	image_speed = 5}

if ((point_in_rectangle(mouse_x,mouse_y,bbox_left,bbox_top,bbox_right,bbox_bottom) or selected == true) && !disabled) {
	
	if (mouse_check_button_pressed(mb_left)) {
		show_debug_message("Join clicked")
		selectAction()
	}}
	