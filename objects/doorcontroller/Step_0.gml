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

		
			