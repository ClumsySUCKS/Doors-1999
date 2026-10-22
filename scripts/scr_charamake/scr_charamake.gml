function part_sprite(_part,_variant,_dire){
var _text = "spr_part_" + _part + "_" + string(_variant) + "_" + _dire
var _sprite = asset_get_index(_text)
return _sprite
}

function give_tint(_slot) {
	switch _slot {
		case "legL": return "skin" break
		case "legR": return "skin" break
		case "hip_acc": return "cloth" break
		case "chest": return "skin" break
		case "armL": return "skin" break
		case "armR": return "skin" break
		case "mouth": return "skin" break
		case "face_acc": return "cloth" break
		case "head_acc": return "cloth" break}}
function skincol_give(_index) {
	return global.skin_pal[_index]}
function clothcol_give(_index) {
	return global.cloth_pal[_index]}
function outcol_give(_index) {
	return global.out_pal[_index]}
function isaac(_limb) {
    switch _limb {
        case "hip_acc":
        return true break
        case "face_acc":
        return true break
        case "head_acc":
        return true break
		case "eyesL":
		return true break
		case "eyesR":
		return true break
		case "mouth":
		return true break
        default: return false}}
function drawspriteplayer(_outfit,_facing,_x,_y,_frame,_walking = false) {
	var _order = global.partorder[$ _facing]
var getPosOut = outcol_give(_outfit.outline)
shader_set(sh_playercolours)
shader_set_uniform_f(global.charaline,colour_get_red(getPosOut) / 255,colour_get_green(getPosOut) / 255,colour_get_blue(getPosOut) / 255)
for (var _i = 0; _i < array_length(_order); _i++) {
	var _sprite = part_sprite(_order[_i],_outfit[$ _order[_i]],_facing)
	if _sprite != -1 {
	var getNameS = array_get_index(global.limbnames, _order[_i])
	var getPosSkin = _outfit.skin[getNameS]
	var getPosCloth = _outfit.cloth[getNameS]
	var giveSkin = skincol_give(getPosSkin)
	var giveCloth = clothcol_give(getPosCloth)
	shader_set_uniform_f(global.charaskin,colour_get_red(giveSkin) / 255,colour_get_green(giveSkin) / 255,colour_get_blue(giveSkin) / 255)
	shader_set_uniform_f(global.characloth,colour_get_red(giveCloth) / 255,colour_get_green(giveCloth) / 255,colour_get_blue(giveCloth) / 255)
	var _f = _frame
	if _order[_i] == "head_acc" && !_walking {_f = floor(current_time * 0.006) mod sprite_get_number(_sprite)}
	draw_sprite(_sprite,_f,_x,_y)}}
shader_reset()}
function drawspriteplayerbig(_outfit,_facing,_x,_y,_frame,_walking = true) {
	var _order = global.partorder[$ _facing]
var getPosOut = outcol_give(_outfit.outline)
shader_set(sh_playercolours)
shader_set_uniform_f(global.charaline,colour_get_red(getPosOut) / 255,colour_get_green(getPosOut) / 255,colour_get_blue(getPosOut) / 255)
for (var _i = 0; _i < array_length(_order); _i++) {
	var _sprite = part_sprite(_order[_i],_outfit[$ _order[_i]],_facing)	
	if _sprite != -1 {
	var getNameS = array_get_index(global.limbnames, _order[_i])
	var getPosSkin = _outfit.skin[getNameS]
	var getPosCloth = _outfit.cloth[getNameS]
	var giveSkin = skincol_give(getPosSkin)
	var giveCloth = clothcol_give(getPosCloth)
	shader_set_uniform_f(global.charaskin,colour_get_red(giveSkin) / 255,colour_get_green(giveSkin) / 255,colour_get_blue(giveSkin) / 255)
	shader_set_uniform_f(global.characloth,colour_get_red(giveCloth) / 255,colour_get_green(giveCloth) / 255,colour_get_blue(giveCloth) / 255)
	var _f = _frame
	if _order[_i] == "head_acc" && !_walking {_f = floor(current_time * 0.006) mod sprite_get_number(_sprite)}
	draw_sprite_ext(_sprite,_f, _x,_y,9,9,0,c_white,1)}}
shader_reset()}