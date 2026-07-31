

if (!surface_exists(self.light_surface))
{
	camera = view_get_camera(0)
	camw = camera_get_view_width(camera)
	camh = camera_get_view_height(camera)
	
	self.light_surface = surface_create(camw,camh)
}

surface_set_target(self.light_surface)
draw_clear(c_black)
camera_apply(camera)

gpu_set_blendmode(bm_subtract)


with obj_player
{
	draw_sprite(light,0,obj_player.x - 24,obj_player.y - 16)	
}

gpu_set_blendmode(bm_normal)

surface_reset_target()

