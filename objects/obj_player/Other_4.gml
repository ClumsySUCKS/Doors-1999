show_debug_message("Room Start: isLocal=" + string(isLocal) + " id=" + string(id))
if isLocal {camera_set_view_target(view_camera[0], id)}
alarm[0] = 100
instance_create_layer(0,0,"trans",obj_dark)
