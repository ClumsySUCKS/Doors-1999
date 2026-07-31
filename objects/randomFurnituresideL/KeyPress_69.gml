














if sprite_index == drawerS
{if instance_exists(obj_player)
{if point_distance(x,y,obj_player.x,obj_player.y) < 25
	{if canpresse == true
{if image_index != 4 - 1
{
	image_index = image_index + 1	
}
if canCount <= 3
		if image_index == 1
		{
			instance_create_layer(x + 8,y + 2,"Drawer",drawerspawn1)
			canpresse = false
			canCount = canCount + 1
			alarm[0] = 30
		}
		if image_index == 2
		{
				instance_create_layer(x + 8,y - 1,"Drawer",drawerspawn2)
				canpresse = false
				canCount = canCount + 1
			alarm[0] = 30
		}
		if image_index == 3
		{
			instance_create_layer(x + 8,y - 8,"Drawer",drawerspawn3)
			canpresse = false
			canCount = canCount + 1
		}
	}
	
}
}
}
