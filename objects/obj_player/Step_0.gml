get_controls(isHost,isLocal)

if (!hasPressed) {
paddle_movement()
if (xInput != 0 || yInput != 0) {
    image_speed = 1;
    if (xInput > 0)      self.sprite_index = playerrightsprites[lobbyMemberID]
    else if (xInput < 0) self.sprite_index = playerleftsprites[lobbyMemberID];
    else if (yInput > 0) self.sprite_index = playerdownsprites[lobbyMemberID];
    else if (yInput < 0) self.sprite_index = playerupsprites[lobbyMemberID];
	if (stoolpotential) {
    var closetstool = instance_nearest(x, y, obj_reception_stool_top_U);
    var playerhopsprites = [spr_chara_noob_hop, spr_chara_avery_hop];
    if interactKey > 0 {
    if (instance_exists(closetstool) && point_distance(closetstool.x, closetstool.y, x, y) < 20) {
        if (!hasPressed) {
            hasPressed = true;
            global.canMove = false;
            
            // Snap position
            x = closetstool.x + 8;
            y = closetstool.y;
            
            // Start hop animation
            sprite_index = playerhopsprites[lobbyMemberID];
            image_index = 0;
            image_speed = 1; // Ensure animation plays
        }
    }
	}}
} else {
    self.image_speed = 0;
    self.image_index = 1; // Idle frame
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

	