var _order = global.part_order[$ facing]

for (var _i = 0; _i < array_length(_order); _i++) {
	var _sprite = part_sprite(_order[_i],outfit[$ _order[_i]],facing)
	if _sprite != -1 {
	draw_sprite(_sprite,image_index, x,y)}}