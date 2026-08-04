global.doorcount = 0 global.hasexit = 0 global.darkroom = 0 global.coinCount = 0
global.room_list = [rm_1,rm_2,rm_4,rm_5]  screechChance = 0 reroll = true
array_shuffle_ext(global.room_list) screechDecide = irandom(3)
new_rooms = ds_map_create() 
rushChance = 0 
rrush = 1       //irandom(rushChance)
amChance = 0 
aambush = irandom(amChance)
canA = false
canR = false
playerspawn = [obj_player.x + 16, obj_player.x - 16,obj_player.x, obj_player.y - 16]
// SPAWNED BY OBJ_PLAYER NOW