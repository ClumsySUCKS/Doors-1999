
if global.amSpawn == true
{if y > doorexit.y + 20 or doorexitb.y + 400 or doorexity.y + 400 or doorexitr.y + 400
{
		global.amSpawn = false
		instance_destroy()
}}

if instance_exists(obj_player)
{
	if point_distance(x,y,obj_player.x,obj_player.y) < 100
	{
		if canDie == false
		{
				vis = collision_line(x,y,obj_player.x,obj_player.y,layer_tilemap_get_id("col"),false,true)
				if vis == noone
				{
					canDie = true	
				}
	
		}
	}
}

if canDie == true
{
	global.hp = 0
}

