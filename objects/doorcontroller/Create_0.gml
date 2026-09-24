randomise()
global.doorcount = 0 global.hasexit = 0 global.darkroom = 0 global.coinCount = 0 
global.room_list = [rm_1,rm_1b,rm_1y,rm_1r,rm_2,rm_2b,rm_2y,rm_2r,rm_3,rm_3b,rm_3y,rm_3r,rm_4,rm_4b,rm_4y,rm_4r,rm_5,rm_5b,rm_5y,rm_5r]  screechChance = 0 reroll = true
new_rooms = ds_map_create()  //[rm_1,rm_1b,rm_1y,rm_1r,rm_2b,rm_2y,rm_2r,rm_3b,rm_3y,rm_3r,rm_4b,rm_4y,rm_4r,rm_5b,rm_5y,rm_5r,rm_2,rm_4,rm_5]
rushChance = 0  
rrush = 1       //irandom(rushChance)
amChance = 0 
aambush = irandom(amChance)
canA = false
canR = false
instance_create_layer(0,0,"HUD",drawgraph)
// SPAWNED BY OBJ_PLAYER NOW
