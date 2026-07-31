




if asd == false {draw_sprite_ext(closethide,0,-550,-950,3,3,0,c_white,palpha)}
if count >= 30 && count < 90
{draw_sprite_ext(dark,0,0,0,1,1,0,c_white,ialpha)
	palpha = 1}

if count > -1 && count <= 29
{
		draw_sprite_ext(dark,0,0,0,1,1,0,c_white,aalpha)
}

if instance_exists(rushO)
{	
		if point_distance(rushO.x,rushO.y,x,y) < 300 && ialpha <= 0
		{
			if rushYes == false
			{
				rushYes = true
			}
		}
		if rushYes == true
		{
			if frame < 7 {frame = frame + frameGo} else {frame = 7}
			if asd == false {draw_sprite_ext(closethideR,frame,-550,-950,3,3,0,c_white,1)}
			if frame >= 7
			{

				if asd == false {draw_sprite_ext(closethide,0,-550,-950,3,3,0,c_white,1)}
			}	
		}
			
	
}
	



	

