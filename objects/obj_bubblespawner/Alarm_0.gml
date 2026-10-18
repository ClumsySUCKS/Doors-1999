randomsphere = irandom(1)
smallsphere = irandom(10)
up = irandom(30)
down = irandom_range(250,280)
if randomsphere == 0 {
instance_create_layer(random(x + room_width),(y + room_height) + 16,"Bubble",obj_bubble)}
if randomsphere == 1{
instance_create_layer(random(x + room_width),(y + room_height) + 16,"Bubble",obj_bubble_big)}
if smallsphere == 0 {instance_create_layer(random(x + room_width),y + room_height + 16,"Bubble",obj_bubble_small)}
hasSpawned = false