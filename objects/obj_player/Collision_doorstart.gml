



if canTeleport == true
{
    global.doorcount = global.doorcount - 1
    global.doorcountdiscord = global.doorcountdiscord - 1
    

    if (global.doorcount == 13)
    {
        global.doorcount = global.doorcount - 1
        global.doorcountdiscord = global.doorcountdiscord - 1
    }
    
    room_goto(global.room_list[global.doorcount])
    canTeleport = false
}