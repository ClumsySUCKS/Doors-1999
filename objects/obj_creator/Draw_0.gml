drawspriteplayerbig(outfit,facing,80,80,image_index,iswalking)
for (var r = 0;r <= array_length(global.limbnames); r++) {
	var ry = xtop + r * spacing
	draw_text(colx[0], ry, "<")
	draw_text(colx[1], ry, ">")
	if !(r == 0 && mode > 0) {draw_rectangle(colx[2],ry,colx[2] + 16,ry + 16,false)}}
	
	var hy = xtop + row * spacing
	draw_set_colour(c_yellow)
	draw_rectangle(colx[col] - 2, hy - 2, colx[col] + 18, hy + 18, true)
	draw_set_colour(c_white)
if isgrid {
	var gx= 160
	var gy = 40
	var gap = 4
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	
	for (var _i = 0; _i < count; _i++) {
		var bx = gx + (_i mod boxer) * (boxw + gap)
		var by = gy + (_i div boxer) * (boxl + gap)
		
		if row > 0 && mode == 1 {draw_set_colour(global.skin_pal[_i])}
		else if row > 0 && mode == 2 {draw_set_colour(global.cloth_pal[_i])}
		else {draw_set_colour(c_dkgray)}
		draw_rectangle(bx,by,bx + boxw, by + boxl,false)
		draw_set_colour(c_white)
		if row == 0 {
			drawspriteplayer(global.chardef[_i],"D",bx + boxw / 2,by + boxl / 2,1)}
		else if mode == 0 {
			var v = _i
			if isaac(sel) {v = _i - 1}
			var label =  string(v)
			if v == -1 {label = "none"}
			draw_text(bx + boxw / 2, by + boxl / 2,label)}
			draw_rectangle(bx,by,bx+boxw,by+boxl,true)}
			
		var cx = gx + (grider mod boxer) * (boxw + gap)
		var cy = gy + (grider div boxer) * (boxl + gap)
		draw_set_colour(c_yellow)
		draw_rectangle(cx - 2, cy - 2, cx + boxw + 2, cy + boxl + 2, true)
		draw_set_colour(c_white)
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)}
var j = draw_get_font()
draw_set_font(gameFont)
draw_text(33,10,"Mode:")
draw_text(33,30,modetext[mode])
draw_set_font(j)



		