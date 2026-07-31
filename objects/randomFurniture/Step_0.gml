


if sprite_index == bookshelfF
	{if cShelf <= 8
	{cShelf = cShelf + 1 choosebooks = irandom(58)
		instance_create_layer(x + 3 + irandom(8),y + 10,"Books",books[choosebooks])
		instance_create_layer(x + 3 + irandom(8),y + 15,"Books",books[choosebooks])
		instance_create_layer(x + 3 + irandom(8),y + 20,"Books",books[choosebooks])
		instance_create_layer(x + 3 + irandom(8),y + 25,"Books",books[choosebooks])}}

if global.s == true {global.s = false instance_create_layer(global.lastx,global.lasty,"Player",obj_player)
	if variable_global_exists("bid") && instance_exists(global.bid)
	{global.bid.sprite_index = closetF}}
