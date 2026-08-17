get_controls(isHost,isLocal)
if stoolpotential {closetstool = instance_nearest(x,y,obj_reception_stool_top_U)}

if (stoolpotential && !hasPressed) {
   
    var playerhopsprites = [spr_chara_noob_hop, spr_chara_avery_hop]
    
    if (interactKey > 0 && instance_exists(closetstool) && point_distance(closetstool.x, closetstool.y, x, y) < 20) {
        hasPressed = true
        inCutscene = true
        global.canMove = false
        

        x = closetstool.x + 8
        y = closetstool.y
        

        sprite_index = playerhopsprites[lobbyMemberID]
        image_index = 0
        image_speed = 1
    }
}


if (inCutscene && hasPressed) && !count {
    var playerhopsprites = [spr_chara_noob_hop, spr_chara_avery_hop]
    
    if (sprite_index == playerhopsprites[lobbyMemberID] && image_index >= 6) {
        
        var playersitsprites = [spr_chara_noob_stool_sit, spr_chara_avery_stool_sit]
        
        if (instance_exists(closetstool)) {
            closetstool.sprite_index = playersitsprites[lobbyMemberID]
							if count == false {count = true alarm[2] = 1200}
        }
        
        image_alpha = 0
    }
}

paddle_movement()

if (!inCutscene) {
    if (xInput != 0 || yInput != 0) {
        image_speed = 1
        if (xInput > 0)      self.sprite_index = playerrightsprites[lobbyMemberID]
        else if (xInput < 0) self.sprite_index = playerleftsprites[lobbyMemberID]
        else if (yInput > 0) self.sprite_index = playerdownsprites[lobbyMemberID]
        else if (yInput < 0) self.sprite_index = playerupsprites[lobbyMemberID]
        
        if (walk_timer < 23) {
            walk_timer = walk_timer + 1
        } else {
            if (sa == false) {
                walk_timer = 0
                audio_play_sound_at(walk1,x,y,0,32,100,1,false,6,0.4)
                sa = true
            }
            if (sa == true) {
                walk_timer = 0
                audio_play_sound_at(walk1,x,y,0,32,100,1,false,6,0.4)
                sa = false
            }
        }
    } else {
        self.image_speed = 0
        self.image_index = 1
    }
}


if isLocal {
    audio_listener_position(x, y, 0)
    audio_listener_orientation(0, 0, 1, 0, -1, 0)
}
	