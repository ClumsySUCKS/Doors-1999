application_surface_draw_enable(false) 
global.isRoomdark = irandom(1000) 
camera = view_get_camera(0)
camw = camera_get_view_width(camera)
camh = camera_get_view_height(camera)

light_surface = surface_create(camw,camh)