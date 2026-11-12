drawspriteplayerbig(outfit,facing,80,80 - godo,image_index,iswalking)
for (var r = 0;r <= array_length(global.limbnames); r++) {
	var ry = xtop + r * spacing
	draw_text(colx[0], ry - godo, "<")
	draw_text(colx[1], ry - godo, ">")
	if !(r == 0 && mode > 0) {draw_rectangle(colx[2],ry - godo,colx[2] + 16,ry + 16 - godo,false)}}
	
	var hy = xtop + row * spacing
	draw_set_colour(c_yellow)
	draw_rectangle(colx[col] - 2, (hy - 2) - godo, colx[col] + 18, (hy + 18) - godo, true)
	draw_set_colour(c_white)
if isgrid {
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	
	for (var _i = 0; _i < count; _i++) {
		var bx = gx + (_i mod boxer) * (boxw + gap)
		var by = gy + (_i div boxer) * (boxl + gap)
		
		if row > 0 && mode == 1 {draw_set_colour(global.skin_pal[_i])}
		else if row > 0 && mode == 2 {draw_set_colour(global.cloth_pal[_i])}
		else {draw_set_colour(c_dkgray)}
		draw_rectangle(bx,by - godo,bx + boxw, (by + boxl) - godo,false)
		draw_set_colour(c_white)
		if row == 0 {
			drawspriteplayer(global.chardef[_i],"D",bx + boxw / 2,(by + boxl / 2) - godo,1)}
		else if mode == 0 {
			var v = _i
			if isaac(sel) {v = _i - 1}
			var label =  string(v)
			if v == -1 {label = "none"}
			draw_text(bx + boxw / 2, (by + boxl / 2) - godo,label)}
			draw_rectangle(bx,by - godo,bx+boxw,(by+boxl) - godo,true)}
			
		var cx = gx + (grider mod boxer) * (boxw + gap)
		var cy = gy + (grider div boxer) * (boxl + gap)
		draw_set_colour(c_yellow)
		draw_rectangle(cx - 2, (cy - 2) - godo, cx + boxw + 2, (cy + boxl + 2) - godo, true)
		draw_set_colour(c_white)
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)}
var j = draw_get_font()
draw_set_font(gameFont)
draw_text(33,10 - godo,"Mode:")
draw_text(33,30 - godo,modetext[mode])
draw_set_font(j)




		