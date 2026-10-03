function part_sprite(_part,_variant,_dire){
var _text = "spr_part_" + _part + "_" + string(_variant) + "_" + _dire
var _sprite = asset_get_index(_text)
return _sprite
}
