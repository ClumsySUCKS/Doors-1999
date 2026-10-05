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
		case "face_acc": return "cloth" break
		case "head_acc": return "cloth" break}}
function skincol_give(_index) {
	return global.skin_pal[_index]}
function clothcol_give(_index) {
	return global.cloth_pal[_index]}
	