if (stoolpotential) {
    var closetstool = instance_nearest(x, y, obj_reception_stool_top_U);
    var playerhopsprites = [spr_chara_noob_hop, spr_chara_avery_hop];
    
    if (instance_exists(closetstool) && point_distance(closetstool.x, closetstool.y, x, y) < 20) {
        if (!actionKey) {
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
}