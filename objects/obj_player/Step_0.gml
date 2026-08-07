_input = rollback_get_input()

if _input.a 
{x-=1
	switch player_id {
	case 0: sprite_index = spr_charanoobL break
	case 1: sprite_index = spr_charaaveryL}
	image_speed = 1}
if _input.d
{x+=1
	switch player_id {
		case 0: sprite_index = spr_charanoobR break
		case 1: sprite_index = spr_charaaveryR}
		image_speed = 1}
if _input.w 
{y-=1
	switch player_id {
		case 0: sprite_index = spr_charanoobU break
		case 1: sprite_index = spr_charaaveryU}
		image_speed = 1}
if _input.s 
{y+=1
	switch player_id {
	case 0: sprite_index = spr_charanoobD break
	case 1: sprite_index = spr_charaaveryD}
	image_speed = 1}
else
{image_speed = 0
	image_index = 1}
	
	