



if canTeleport == true
{global.doorcount = global.doorcount + 1
    global.doorcountdiscord++
    if (global.doorcount == 13)
    {
        global.doorcount = global.doorcount + 1
        global.doorcountdiscord++
    }
    instance_destroy(obj_SpawnPoint)
	instance_create_layer(x,y,"Instances",obj_SpawnPoint)   
    go_to_room(global.doorcount)
    canTeleport = false
}