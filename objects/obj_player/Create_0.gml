global.guiw = display_get_gui_width() at_window = false
global.guiw = display_get_gui_width() global.doorcreated = false lightsubin = 0 i = false
global.guih = display_get_gui_height()  isCrouched = false
collidewith = [layer_tilemap_get_id("col"), randomFurniture, randomFurnituresideR, randomFurnituresideL,obj_windowR,obj_hotelplant,obj_reception_stool_bottom,obj_reception_stool_top]
move_speed = 1  
self.sprite_index = spr_charanoob_standU
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
inti_controls()