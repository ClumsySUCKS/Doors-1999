randomsphere = irandom(1)
smallsphere = irandom(10)
up = irandom(30)
down = irandom_range(250,280)
if randomsphere == 0 {
instance_create_layer(x - 32,y + choose(up,down),"Backstuff",obj_introsphere)}
if randomsphere == 1{
	instance_create_layer(x - 32,y + choose(up,down),"Backstuff",obj_introsphere_big)}
if smallsphere == 0 {instance_create_layer(x - 32,irandom_range(30,250),"Backstuff",obj_introsphere_small)}
hasSpawned = false