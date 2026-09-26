if reroll == true && global.isRoomdark == 0
{reroll = false
	alarm[0] = 100
	if screechChance == 0
	{alarm[0] = 300
		newinst = noone
		if screechDecide == 0
		{newinst = instance_create_layer(obj_player.x + 16,obj_player.y,"Player",obj_screech)
			if newinst != noone {newinst.sprite_index = spr_screech3}}
		if screechDecide == 1
		{newinst = instance_create_layer(obj_player.x - 16,obj_player.y,"Player",obj_screech)
			if newinst != noone {newinst.sprite_index = spr_screech2}}
		if screechDecide == 2
		{newinst = instance_create_layer(obj_player.x,obj_player.y - 32,"Player",obj_screech)
			if newinst != noone {newinst.sprite_index = spr_screech1}}
		if screechDecide == 3
		{newinst = instance_create_layer(obj_player.x,obj_player.y + 16,"Player",obj_screech)
			if newinst != noone {newinst.sprite_index = spr_screech4}}
		screechDecide = irandom(3)
		}}
		
var _fdoor = get_forward_door()
if _fdoor != noone {
	
	with obj_player {if isLocal && point_distance(x,y,_fdoor.x,_fdoor.y) < 40 {_near = true}}
	if _near != gathered_forward {gathered_forward = _near; send_gather_status(true, _near)}}
if instance_exists(doorstart) && current_time >= start_door_active_at {
	var _near_b = false
	with obj_player {if isLocal && point_distance(x,y,doorstart.x,doorstart.y) < 40 {_near_b = true}}
	if _near_b != gathered_backward {gathered_backward = _near_b; send_gather_status(false, _near_b)}}
	if net_is_host() {host_update_gather_timer()}

		
			