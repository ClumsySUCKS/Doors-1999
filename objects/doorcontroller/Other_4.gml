





if (ds_map_find_value(new_rooms, room) == undefined) 
{
    ds_map_add(new_rooms, room, true);
	randomTimeRush = irandom(60)
	if aambush == 1
	if global.amSpawn == false
	{if  global.rushSpawn == false
		{{
		instance_create_layer(doorstart.x,doorstart.y - 30,"dark",ambushO)
		canR = true
	}}}
} 




	if rrush == 0
	if canR == false
	if global.amSpawn == false
	{{if global.rushSpawn == false
		{{
		instance_create_layer(doorstart.x,doorstart.y - 30,"Player",rushO)
	}}}}
	
	
start_door_active_at = current_time + 7000
gathered_forward = false
gathered_backward = false
if net_is_host() {gather_time = -1; ds_map_clear(door_gather_state)}


