alarm[0] = 200
alarm[1] = 400
alarm[2] = 230
np_setpresence("Playing", "In Limbo's Menu", "doors_1999_title_dgs", "doors_1999_title_dgs")
if (variable_global_exists("skip_intro") && global.skip_intro) {alarm[1] = 1; global.skip_intro = false}

