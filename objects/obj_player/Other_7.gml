var playerhopsprites = [spr_chara_noob_hop, spr_chara_avery_hop];
var playersitsprites = [spr_chara_noob_stool_sit, spr_chara_avery_stool_sit]
if (sprite_index == playerhopsprites[lobbyMemberID] && image_index >= 6) {
    image_speed = 0;
    sprite_index = playersitsprites[lobbyMemberID]; 
}