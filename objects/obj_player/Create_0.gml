global.guiw = display_get_gui_width() at_window = false 	hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));
global.guiw = display_get_gui_width() global.doorcreated = false lightsubin = 0 i = false
global.guih = display_get_gui_height()  isCrouched = false
collidewith = [layer_tilemap_get_id("col"), randomFurniture, randomFurnituresideR, randomFurnituresideL,obj_windowR,obj_hotelplant,obj_reception_stool_bottom,obj_reception_stool_top_U,obj_windowL,obj_inviswall]
move_speed = 1 trueplayer = id
playerupsprites = [spr_charanoobU,spr_charaaveryU]
playerupstandsprites = [spr_charanoob_standU,spr_charaavery_standU]
playerdownsprites = [spr_charanoobD,spr_charaaveryD]
playerdownstandsprites = [spr_charanoob_standD,spr_charaavery_standD]
playerleftsprites = [spr_charanoobL,spr_charaaveryL]
playerleftstandsprites = [spr_charanoob_standL,spr_charaavery_standL]
playerrightsprites = [spr_charanoobR,spr_charaaveryR]
playerrightstandsprites = [spr_charanoob_standR,spr_charaavery_standR]
self.sprite_index = playerupstandsprites[lobbyMemberID]
canTeleport = false  stoolpotential = false
exityes = false hasPressed = false
global.isHiding = false   
global.rushSpawn = false
global.amSpawn = false
global.canMove = true
global.canInteract = true
walk_timer = 0
ka = false
sa = false 
localSteamID = steam_get_user_steam_id()
lobbyHost = steam_lobby_get_owner_id()
isHost = steam_lobby_is_owner()
isLocal = (localSteamID == steamID)
if isLocal {camera_set_view_target(view_camera[0],id)}
if global.doorcreated == false
{global.doorcreated = true
	instance_create_depth(0,0,-10,doorcontroller)}
init_controls()
if room == rm_reception {stoolpotential = true}