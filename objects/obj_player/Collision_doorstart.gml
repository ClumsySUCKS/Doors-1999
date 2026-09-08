



if canTeleport == true
{
    global.doorcount = global.doorcount - 1
    global.doorcountdiscord = global.doorcountdiscord - 1
    if (global.doorcount == 13)
    {
        global.doorcount = global.doorcount - 1
        global.doorcountdiscord = global.doorcountdiscord - 1
    }
    instance_destroy(obj_SpawnPoint)
	instance_create_layer(x,y,"Instances",obj_SpawnPoint)    
    room_goto(global.room_list[global.doorcount])
    canTeleport = false
}