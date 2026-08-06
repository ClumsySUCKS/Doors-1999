global.guiw = display_get_gui_width() global.doorcreated = false lightsubin = 0 i = false
global.guih = display_get_gui_height()  isCrouched = false
collidewith = [layer_tilemap_get_id("col"), randomFurniture, randomFurnituresideR, randomFurnituresideL]
move_speed = 1
sprite_index = spr_charanoob_standU 
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
	instance_create_layer(0,0,"HUD",drawgraph)
	instance_create_depth(0,0,-10,doorcontroller)}zz
