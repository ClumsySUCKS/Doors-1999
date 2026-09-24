var closetplayer = instance_nearest(x,y,obj_player)
if point_distance(x,y,closetplayer.x,closetplayer.y) < 25 {array_push(closetplayer.playeritems, key)
	instance_destroy()}