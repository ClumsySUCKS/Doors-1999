if (variable_global_exists("gather_timer_display") && global.gather_timer_display >= 0) && instance_exists(obj_doorradiusD) {
    draw_text(obj_doorradiusD.x, obj_doorradiusD.y, string(ceil(global.gather_timer_display / 1000)))
}