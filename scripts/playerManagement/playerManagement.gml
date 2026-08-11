function grab_spawn_point(_player) {
	_spawnpoint = instance_find(obj_spawnPoint, _player)
	if _spawnpoint == noone return {x:0,y:0}
	return {x: _spawnpoint.x, y:_spawnpoint.y}
	
	
}