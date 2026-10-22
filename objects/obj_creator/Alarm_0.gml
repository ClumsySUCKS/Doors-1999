spritechange++
switch facing {
case "D":facing = "R" break
case "R":facing = "U" break
case "U":facing = "L" break
case "L":facing = "D" break}


if spritechange == 4 {
spritechange = 0
	if iswalking == false {image_speed = 0.06}
	else {image_speed = 0 image_index = 1}
	iswalking = !iswalking}
alarm[0] = 240
show_debug_message(string(spritechange) + facing)