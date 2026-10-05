global.guiw = display_get_gui_width() at_window = false 	hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
ver = keyboard_check(ord("S")) - keyboard_check(ord("W")); key = undefined  
global.guiw = display_get_gui_width() lightsubin = 0 i = false	
global.guih = display_get_gui_height()  isCrouched = false playeritems = [] 
collidewith = [layer_tilemap_get_id("col"), randomFurniture, randomFurnituresideR, randomFurnituresideL,obj_windowR,obj_hotelplant,obj_reception_stool_bottom,obj_reception_stool_top_U,obj_windowL,obj_inviswall,obj_wall,obj_wall_wall,obj_wall_middle]
move_speed = 1 trueplayer = id inCutscene = false hasPressed = false count = 0
sprite_index = global.playerupstandsprites[lobbyMemberID]

canTeleport = false  stoolpotential = false closetpotential = false
exityes = false hasPressed = false
global.isHiding = false    inCutscene = false
global.rushSpawn = false
global.amSpawn = false
global.canMove = true
global.canInteract = true
walk_timer = 0
ka = false 
sa = false 
localSteamID = net_my_id()
lobbyHost = net_host_id()
isHost = net_is_host()
isLocal = (localSteamID == steamID)
persistent = isLocal
if isLocal {camera_set_view_target(view_camera[0],id)}
if !instance_exists(doorcontroller) {
	instance_create_depth(0,0,-10,doorcontroller)}
init_controls()
if room == rm_reception {stoolpotential = true}
if instance_exists(randomFurniture) {closetpotential = true}
if (is_undefined(lobbyMemberID)) {lobbyMemberID = 0
self.sprite_index = global.playerupstandsprites[lobbyMemberID]}
tx = x
ty = y
facing = "D"
pos_buffer = [{x:x, y:y, t:current_time}]
outfit = {legL: 0, legR:0,chest:0,armL:0,armR:0,head:0,eyesL:0,eyesR:0,hip_acc:-1,face_acc:-1,head_acc:-1,skin:array_create(11,0),cloth:array_create(11,0),outline:0}
var _text = "spr_part_" + "chest_" + string(outfit.chest) + "_" + "D"
var _sprite = asset_get_index(_text)
show_debug_message(_sprite)
var _s = part_sprite("chest", outfit.chest, "D")
show_debug_message(_s)
var getName = array_get_index(global.limb_names,"chest")
var getPosSkin = outfit.skin[getName]
var debug = skincol_give(getPosSkin)
show_debug_message(debug)

