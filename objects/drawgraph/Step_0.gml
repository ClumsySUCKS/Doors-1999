







if count >= 50
{if trans != 1
	{trans = 1}}





textr = irandom(30)
texty = irandom(30)
eyer = irandom(5)
eyey = irandom(5)
if go == 4 or go == 4.1{
if characters < message_length
{characters += increase
message_draw = string_copy(choosetext,1,characters)}}

if go == 5 or go == 5.1{
	ra = ra + 0.8}
	if global.rushKill == 1 or global.rushKill == 2
{if global.rushKill == 1
	{
		alarm[0] = 60	
	}
	if go == 4 or go == 4.1
{count = count + 1}
	if count >= 100 {go = go + 1}
	if go == 4 {audio_play_sound(rushsoundt,5,true,20) go = go + 0.1}
		if count >= 100 {go = go + 1}}
		
		if go == 5 or go == 5.1
		{if count >= 150 {go = go + 1}
count = count + 1}
	
	