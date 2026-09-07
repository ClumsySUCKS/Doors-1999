amount = instance_number(roomspot)
if amount > 0 {
    randomindex = irandom(amount - 1)
    truexit = instance_find(roomspot,randomindex) 
    
    // Wrap the angle so negatives become standard 0-359 values
    angle = round(truexit.image_angle) % 360;
    if (angle < 0) angle += 360;

    if angle == 270 { // Formerly -90
        instance_create_layer(truexit.x - 16,truexit.y,"Instances",sidexitL)
    }
    if angle == 90 {
        instance_create_layer(truexit.x,truexit.y,"Instances",sidexitR)
    }
    if angle == 0 {
        instance_create_layer(truexit.x,truexit.y,"Instances",doorexit)
    }
    // Optional: Add a fallback for 180 if you ever need backward exits!
}
