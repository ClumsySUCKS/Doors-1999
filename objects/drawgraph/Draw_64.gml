







if global.rushKill == 1 or global.rushKill == 2
{	
	global.rushKill = 2
	draw_sprite(dark,0,0,0)
	if go == 2
	{draw_sprite_ext(rushd1,0,global.guiw * 0.5,global.guih * 0.5,5,5,0,c_white,1)}
	if go == 3 or go == 4 or go == 4.1
	{draw_sprite_ext(rushd2,0,global.guiw * 0.5, global.guih * 0.5,5,5,0,c_white,1)}
if go == 4 or go == 4.1
{count = count + 1
	if count >= 75 && count < 100 {draw_sprite_ext(rushd6,0,global.guiw * 0.5 + textr, global.guih * 0.5 + texty,6,6,0,c_white,trans) audio_play_sound(rushscream,6,false)}
	draw_circle(global.guiw * 0.6 + eyer,global.guih * 0.2 + eyey,5,false)
	draw_circle(global.guiw * 0.4 + eyer,global.guih * 0.2 + eyey,5,false)
	draw_set_colour(c_white) draw_set_font(bigFont)
	draw_text_ext(global.guiw * 0.1 + textr,global.guih * 0.1 + texty,message_draw,-1,1000)		draw_text_ext(global.guiw * 0.5 + textr,global.guih * 0.4 + texty,message_draw,-1,1000)
	draw_text_ext(global.guiw * 0.45 + textr,global.guih * 0.3 + texty,message_draw,-1,1000)	draw_text_ext(global.guiw * 0.3 + textr,global.guih * 0.2 + texty,message_draw,-1,1000)
	draw_text_ext(global.guiw * 0.1 + textr,global.guih * 0.3 + texty,message_draw,-1,1000)		draw_text_ext(global.guiw * 0.1 + textr,global.guih * 0.45 + texty,message_draw,-1,1000)
	draw_text_ext(global.guiw * 0.1 + textr,global.guih * 0.67 + texty,message_draw,-1,1000)	draw_text_ext(global.guiw * 0.05 + textr,global.guih * 0.55 + texty,message_draw,-1,1000)
	draw_text_ext(global.guiw * 0.6 + textr,global.guih * 0.6 + texty,message_draw,-1,1000)		draw_text_ext(global.guiw * 0.05 + textr,global.guih * 0.3 + texty,message_draw,-1,1000)
	if go == 4 {audio_play_sound(rushsoundt,5,true,20) go = go + 0.1}
	if count >= 100 {go = go + 1}
}
}
		if go == 5 or go == 5.1
		{draw_sprite_ext(rushd6,0,global.guiw * 0.5, global.guih * 0.5,6 + ra,6 + ra,0,c_white,1) if go == 5 {audio_play_sound(rushscreamt,6,true,-100) go = go + 0.1}
			
		}
		if go == 6
		{
			audio_stop_sound(rushscreamt)	
		}


		
		











