if ((point_in_rectangle(mouse_x,mouse_y,bbox_left,bbox_top,bbox_right,bbox_bottom) or selected == true) && !disabled) {
	if (mouse_check_button_pressed(mb_left)) {
		show_debug_message("Host clicked") 
		if steam_initialised() {show_debug_message("Steam Initialised")}
		selectAction()
	}}