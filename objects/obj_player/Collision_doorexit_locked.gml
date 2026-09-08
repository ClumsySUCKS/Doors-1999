
if array_contains(playeritems,"key"){
	if canTeleport == true
{global.doorcount = global.doorcount + 1
    global.doorcountdiscord++
    if (global.doorcount == 13)
    {
        global.doorcount = global.doorcount + 1
        global.doorcountdiscord++
    }
    
    room_goto(global.room_list[global.doorcount])
    canTeleport = false
}}