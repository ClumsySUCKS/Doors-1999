global.guiw = display_get_gui_width() global.doorcreated = false lightsubin = 0 i = false
global.guih = display_get_gui_height()  isCrouched = false
collidewith = [layer_tilemap_get_id("col"), randomFurniture, randomFurnituresideR, randomFurnituresideL]
move_speed = 1  camera_set_view_target(view_camera[0], self)
playerMoveSprites = [] 
playerStandSprites = []
playerStartSprite = undefined
switch player_id {
	case 0: playerStartSprite = spr_charanoob_standU 
	array_push(playerMoveSprites,spr_charanoobU,spr_charanoobD,spr_charanoobL,spr_charanoobR)
	array_push(playerStandSprites,spr_charanoob_standU,spr_charanoob_standD,spr_charanoob_standL,spr_charanoob_standR)
	break
	case 1: playerStartSprite = spr_charaavery_standU
	array_push(playerMoveSprites,spr_charaaveryU,spr_charaaveryD,spr_charaaveryL,spr_charaaveryR)
	array_push(playerStandSprites,spr_charaavery_standU,spr_charaavery_standD,spr_charaavery_standL,spr_charaavery_standR)
}
	
sprite_index = playerStartSprite
canTeleport = false
exityes = false
global.isHiding = false 
global.rushSpawn = false
global.amSpawn = false
global.canMove = true
global.canInteract = true
walk_timer = 0
ka = false
sa = false 
localSteamID = steam_get_user_steam_id()
isLocal = localSteamID == steamID
if global.doorcreated == false
{global.doorcreated = true
	instance_create_depth(0,0,-10,doorcontroller)}
	x = obj_spawnPoint.x
	y = obj_spawnPoint.y
