


if ((point_in_rectangle(mouse_x,mouse_y,bbox_left,bbox_top,bbox_right,bbox_bottom) or selected == true) && !disabled ) {
	// The buttom was clicked (flicker for 1 frame)
	
	if (mouse_check_button_pressed(mb_left)) {
		selectAction();}}