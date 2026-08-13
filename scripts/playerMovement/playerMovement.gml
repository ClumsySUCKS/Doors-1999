function paddle_movement(){
	



	if (place_meeting(x + xInput, y, collidewith)) 
{

    while (!place_meeting(x + sign(xInput), y, collidewith)) 
    {
        x += sign(xInput)
    }
    xInput = 0
}
x += xInput


if (place_meeting(x, y + yInput, collidewith)) 
{
  
    while (!place_meeting(x, y + sign(yInput), collidewith)) 
    {
        y += sign(yInput)
    }
    yInput = 0
}
y += yInput
}
