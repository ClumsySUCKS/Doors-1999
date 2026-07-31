amount = instance_number(roomspot)
if amount > 0 {
	randomindex = irandom(amount - 1)
	truexit = instance_find(roomspot,randomindex) 
	angle = round(truexit.image_angle)
	if angle == -90 {
		instance_create_layer(truexit.x - 16,truexit.y,"Instances",sidexitL)}
	if angle == 90{instance_create_layer(truexit.x,truexit.y,"Instances",sidexitR)}
	if angle == 0{
	instance_create_layer(truexit.x,truexit.y,"Instances",doorexit)}}
