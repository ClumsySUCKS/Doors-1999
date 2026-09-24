if (point_in_rectangle(mouse_x,mouse_y,bbox_left,bbox_top,bbox_right,bbox_bottom)) {
if (mouse_check_button_pressed(mb_left)) {random_set_seed(20260101) room_goto(rm_reception)
	instance_create_layer(obj_SpawnPoint.x,obj_SpawnPoint.y,"Player",obj_player)}}