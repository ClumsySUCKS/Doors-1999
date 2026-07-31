















if sprite_index == drawerF
{if instance_exists(obj_player)
    {if point_distance(x, y, obj_player.x, obj_player.y) < 25
        {if canpresse == true
            {if canCount >= 3
                {canpresse = false
                    alarm[0] = 5
                    exit}
				canpresse = false
                if image_index < 3
                {image_index = image_index + 1}
                canCount = canCount + 1
				if image_index == 1
                {instance_create_layer(x + 4, y + 5, "Drawer", drawerspawn1)}
                else if image_index == 2
                {instance_create_layer(x + 4, y + 2, "Drawer", drawerspawn2)}
                else if image_index == 3
                {instance_create_layer(x + 4, y - 1, "Drawer", drawerspawn3)}
                alarm[0] = 30}}}}
if sprite_index == closetF
{if canpresse == true
    {canpresse = false
        if obj_player.x > x && obj_player.x < x + 20
        {global.lastx = obj_player.x 
            global.lasty = obj_player.y
            instance_destroy(obj_player)
            global.bid = id
            global.isHiding = true
            global.canMove = false
            instance_create_layer(x, y, "dark", draw_hide)
            sprite_index = closetFanim
            image_speed = 1
            alarm[1] = 25  
            alarm[0] = 200}}}
