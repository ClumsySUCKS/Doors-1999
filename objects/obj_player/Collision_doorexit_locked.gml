

	if canTeleport == true
{global.doorcount = global.doorcount + 1
    global.doorcountdiscord++
    if (global.doorcount == 13)
    {
        global.doorcount = global.doorcount + 1
        global.doorcountdiscord++
    }
    
    go_to_room(global.doorcount)
    canTeleport = false
}