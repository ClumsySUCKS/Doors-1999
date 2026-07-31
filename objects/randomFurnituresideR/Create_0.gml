canpresse = true
furniture = [drawerSR, drawerSR, drawerSR]
if irandom(2) == 0
{
result = irandom(2)
sprite_index = furniture[result]
image_speed = 0
}

if sprite_index == drawerSR
{
	drawerspawn1 = choose(nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,fivecoin,fivecoin,fivecoin,fivecoin,fivecoin,fivecoin,fivecoin,fiftecoin,fiftecoin,fiftecoin,fiftecoin,fiftecoin)
drawerspawn2 = choose(nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,fivecoin,fivecoin,fivecoin,fivecoin,fivecoin,fivecoin,fivecoin,fiftecoin,fiftecoin,fiftecoin,fiftecoin,fiftecoin)
drawerspawn3 = choose(nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,fivecoin,fivecoin,fivecoin,fivecoin,fivecoin,fivecoin,fivecoin,fiftecoin,fiftecoin,fiftecoin,fiftecoin,fiftecoin)

canCount = 0
canRun = false
if sprite_index == drawerSR
{mask_index = drawercollision
	canRun = true
}
	
}