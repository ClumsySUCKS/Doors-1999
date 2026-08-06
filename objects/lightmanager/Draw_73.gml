



surface_set_target(self.light_surface)
draw_clear(c_black)
camera_apply(camera)

gpu_set_blendmode(bm_subtract)

with obj_wall_light_D
{
	draw_sprite_ext(spr_wall_light,0,obj_wall_light_D.x,obj_wall_light_D.y,0,0,0,c_blue,1)
}

with obj_wall_light_L
{
	draw_sprite(spr_wall_light,0,obj_wall_light_L.x,obj_wall_light_L.y)
}

with obj_wall_light_R
{
	draw_sprite(spr_wall_light,0,obj_wall_light_R.x,obj_wall_light_R.y)
}

with obj_player
{
	draw_sprite(light,0,obj_player.x - 24,obj_player.y - 16)	
}

gpu_set_blendmode(bm_normal)

surface_reset_target()

