if obj_player.isLocal {
if point_distance(x,y,obj_player.x,obj_player.y) < 10 {
	array_push(obj_player.playeritems, key)
	instance_destroy()}}
	