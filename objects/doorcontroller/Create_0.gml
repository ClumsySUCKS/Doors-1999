global.doorcount = 0 global.hasexit = 0 global.darkroom = 0 global.coinCount = 0 
global.room_list = [rm_1,rm_1b,rm_1y,rm_1r,rm_2b,rm_2y,rm_2r,rm_3b,rm_3y,rm_3r,rm_4b,rm_4y,rm_4r,rm_5b,rm_5y,rm_5r,rm_2,rm_4,rm_5]  screechChance = 0 reroll = true
global.discord_list = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10","11", "12", "13", "14", "15", "16", "17", "18", "19", "20","21", "22", "23", "24", "25", "26", "27", "28", "29", "30","31", "32", "33", "34", "35", "36", "37", "38", "39", "40","41", "42", "43", "44", "45", "46", "47", "48", "49", "50","51", "52", "53", "54", "55", "56", "57", "58", "59", "60","61", "62", "63", "64", "65", "66", "67", "68", "69", "70","71", "72", "73", "74", "75", "76", "77", "78", "79", "80","81", "82", "83", "84", "85", "86", "87", "88", "89", "90","91", "92", "93", "94", "95", "96", "97", "98", "99", "100"]
array_shuffle_ext(global.room_list) screechDecide = irandom(3)
new_rooms = ds_map_create() 
rushChance = 0  
rrush = 1       //irandom(rushChance)
amChance = 0 
aambush = irandom(amChance)
canA = false
canR = false
instance_create_layer(0,0,"HUD",drawgraph)
// SPAWNED BY OBJ_PLAYER NOW
