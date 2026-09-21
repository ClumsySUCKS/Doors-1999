


draw_self()
draw_set_halign(fa_left)
draw_set_valign(fa_middle)

if is_string(lobby_id) {
	draw_text_transformed(bbox_left+10,y-100,"Code: " + lobby_id,.2,.2,0)
	draw_text_transformed(bbox_left+10,y+5,"Creator: " + lobby_creator,.2,.2,0)
} else {
	draw_text(bbox_left+10,y + 15,"Searching...")
}