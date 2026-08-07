if (!surface_exists(self.light_surface))
{
	camera = view_get_camera(0)
	camw = camera_get_view_width(camera)
	camh = camera_get_view_height(camera)
	
	self.light_surface = surface_create(camw,camh)
}