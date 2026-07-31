randomise()
canpresse = true
furniture = [drawerF, closetF, closetF]
cShelf = 0 
books = [nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,Object25,Object25,Object25,Object30,Object30,Object30,Object35,Object35,Object35,Object40,Object40,Object40,Object45,Object45,Object45,Object50,Object50,Object50,Object26,Object27,Object28,Object29,Object30,Object31,Object32,Object33,Object34,Object35,Object36,Object37,Object38,Object39,Object40,Object41,Object42,Object43,Object44,Object45,Object46,Object47,Object48,Object49,Object50,Object51,Object52,Object53,Object54]
if irandom(5) == 0
{
result = irandom(1)
sprite_index = furniture[result]
image_speed = 0
}

if sprite_index == drawerF
{ y = y - 10
	drawerspawn1 = choose(nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,fivecoin,fivecoin,fivecoin,fivecoin,fivecoin,fivecoin,fivecoin,fiftecoin,fiftecoin,fiftecoin,fiftecoin,fiftecoin)
drawerspawn2 = choose(nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,fivecoin,fivecoin,fivecoin,fivecoin,fivecoin,fivecoin,fivecoin,fiftecoin,fiftecoin,fiftecoin,fiftecoin,fiftecoin)
drawerspawn3 = choose(nothing,nothing,nothing,nothing,nothing,nothing,nothing,nothing,fivecoin,fivecoin,fivecoin,fivecoin,fivecoin,fivecoin,fivecoin,fiftecoin,fiftecoin,fiftecoin,fiftecoin,fiftecoin)

canCount = 0
canRun = false
if sprite_index == drawerF
{mask_index = drawercollision
	canRun = true
}
	
}

if sprite_index == bookshelfF
{	y = y - 25
	
}

if sprite_index  == closetF
{
		y = y - 25
}
otherObj = instance_place(x - 16, y, randomFurniture)
if otherObj != noone
{
	if otherObj.sprite_index == closetF
	{
		instance_destroy()	
	}
}
global.s = false