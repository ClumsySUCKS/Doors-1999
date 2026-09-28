if (inCutscene) {
	draw_self()} else {
		var _drawn = draw_character(x,y,facing,image_index,image_alpha,outfit)
		if (_drawn == 0) draw_self()}