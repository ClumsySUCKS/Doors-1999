global.guiw = display_get_gui_width() global.doorcreated = false 
global.guih = display_get_gui_height()
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
{instance_create_depth(0,0,-10,doorcontroller)}
