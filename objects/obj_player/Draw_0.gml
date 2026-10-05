var _order = global.part_order[$ facing]
var getPosOut = outcol_give(outfit.outline)
shader_set(sh_playercolours)
shader_set_uniform_f(global.charaline,colour_get_red(getPosOut) / 255,colour_get_green(getPosOut) / 255,colour_get_blue(getPosOut) / 255)
for (var _i = 0; _i < array_length(_order); _i++) {
	var _sprite = part_sprite(_order[_i],outfit[$ _order[_i]],facing)
	if _sprite != -1 {
	var getNameS = array_get_index(global.limb_names, _order[_i])
	var getPosSkin = outfit.skin[getNameS]
	var getPosCloth = outfit.cloth[getNameS]
	var giveSkin = skincol_give(getPosSkin)
	var giveCloth = clothcol_give(getPosCloth)
	shader_set_uniform_f(global.charaskin,colour_get_red(giveSkin) / 255,colour_get_green(giveSkin) / 255,colour_get_blue(giveSkin) / 255)
	shader_set_uniform_f(global.characloth,colour_get_red(giveCloth) / 255,colour_get_green(giveCloth) / 255,colour_get_blue(giveCloth) / 255)
	draw_sprite(_sprite,image_index, x,y)}}
shader_reset()