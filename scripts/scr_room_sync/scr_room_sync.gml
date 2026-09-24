function go_to_room(_door_index){
	if (!variable_global_exists("room_seed")) {global.room_seed = 0}
	random_set_seed(global.room_seed + _door_index)
	room_goto(global.room_list[_door_index])

}