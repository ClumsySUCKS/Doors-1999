get_controls(isHost,isLocal)

paddle_movement()
if (xInput != 0 || yInput != 0) {
    image_speed = 1;
    if (xInput > 0)      sprite_index = playerrightsprites[lobbyMemberID]
    else if (xInput < 0) sprite_index = playerleftsprites[lobbyMemberID];
    else if (yInput > 0) sprite_index = playerdownsprites[lobbyMemberID];
    else if (yInput < 0) sprite_index = playerupsprites[lobbyMemberID];
} else {
    image_speed = 0;
    image_index = 0; // Idle frame
}

	