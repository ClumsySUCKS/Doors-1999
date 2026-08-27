if keyboard_check_pressed(ord("E")) && pressed == false && obj_selector.spot == 0{pressed = true image_speed = 1}

if image_index >= 6 && sprite_index != spr_buttonplay_dupe {
	image_speed = 0}
if image_index >= 23 {
	image_speed = 0 sprite_index = spr_buttonplay}