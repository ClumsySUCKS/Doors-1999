draw_sprite(wgadsg, 0,0,0) 
draw_sprite(left,0,-460,0)
draw_sprite(left,0,1000,0)
draw_set_font(bigFont)
draw_text_colour(760,874,string(global.coinCount), #f6c9ad,#f6c9ad,c_white,c_white,1)
draw_sprite(coinicon,0,660,866)
draw_sprite_ext(healthoutside,0,130,870,5,5,0,c_white,1)
draw_sprite_stretched_ext(healthinside,0,130,870,240 * (global.hp / global.hp_max),80,c_white,1)
draw_sprite_ext(healthicon,0,100,854,7,7,0,c_white,1)
draw_sprite_ext(doornumberHUD,0,400,854,7,7,0,c_white,1)
text = string_replace_all(string_format(global.doorcount,4,0)," ","0")
draw_sprite_ext(spr_itemHUD,0,248,854,5,7,0,c_white,1)
draw_text_transformed_colour(432,875,text,0.7,0.9,0,#5B2418,#5B2418,#5B2418,#5B2418,1)
draw_set_font(gameFont)
//draw_text(300,830, $"Steam initalised? {steam_initialised() ? "Yes" : "No"}")




if global.hp <= 0
{draw_sprite_ext(healthdead,0,660,854,7,7,0,c_white,1)}

//draw_sprite_ext(healthoutside,0,690,870,5,5,0,c_white,1)
//draw_sprite_stretched_ext(healthinside,0,690,870,240 * (global.hp / global.hp_max),80,c_white,1)
//draw_sprite_ext(healthicon,0,660,854,7,7,0,c_white,1)
//draw_sprite(coinicon,0,100,866)
//draw_text_colour(200,874,string(global.coinCount), #f6c9ad,#f6c9ad,c_white,c_white,1)
//draw_sprite_ext(doornumberHUD,0,400,854,7,7,0,c_white,1)
//draw_text_transformed_colour(432,875,text,0.7,0.9,0,#5B2418,#5B2418,#5B2418,#5B2418,1)



if global.hp != healthchange
{	
	if global.hp > healthchange
	{
			
	}
}