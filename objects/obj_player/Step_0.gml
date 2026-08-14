get_controls(isHost,isLocal)

if (!hasPressed) {
paddle_movement()
if (xInput != 0 || yInput != 0) {
    image_speed = 1;
    if (xInput > 0)      sprite_index = playerrightsprites[lobbyMemberID]
    else if (xInput < 0) sprite_index = playerleftsprites[lobbyMemberID];
    else if (yInput > 0) sprite_index = playerdownsprites[lobbyMemberID];
    else if (yInput < 0) sprite_index = playerupsprites[lobbyMemberID];
} else {
    image_speed = 0;
    image_index = 1; // Idle frame
}
}
if (hasPressed) {
    // Check if the hop animation reached or passed frame 6
    if (image_index >= 6) {
        var closetstool = instance_nearest(x, y, obj_reception_stool_top_U);
        var playersitsprites = [spr_chara_noob_stool_sit, spr_chara_avery_stool_sit];
        
        if (instance_exists(closetstool)) {
            closetstool.sprite_index = playersitsprites[lobbyMemberID];
        }
        
        image_alpha = 0
    }
}

	