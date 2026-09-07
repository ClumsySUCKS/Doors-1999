



	if canTeleport == true
{if global.doorcount + 1 == 13 {global.doorcount = global.doorcount + 2; 
	global.doorcountdiscord = global.doorcountdiscord + 2
	room_goto(global.room_list[global.doorcount])
canTeleport = false}
if global.doorcount + 1 != 13 {
global.doorcount = global.doorcount + 1 global.doorcountdiscord++
room_goto(global.room_list[global.doorcount])
canTeleport = false
}}





