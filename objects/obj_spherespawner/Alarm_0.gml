randomsphere = irandom(2)
up = irandom(30)
down = irandom_range(250,280)
if randomsphere == 0 {
instance_create_layer(x - 32,y + choose(up,down),"Backstuff",obj_introsphere)}
if randomsphere == 1{
	instance_create_layer(x - 32,y + choose(up,down),"Backstuff",obj_introsphere_big)}
if randomsphere == 2 {instance_create_layer(x - 32,choose(up,down),"Backstuff",obj_introsphere_big)}
hasSpawned = false