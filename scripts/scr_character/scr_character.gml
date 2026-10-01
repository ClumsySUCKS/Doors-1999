

function part_variant_count(_slot, _direction) {
var _slot_name = global.part_names[_slot]
var _variant = 0
while (asset_get_index("spr_part_" + string(_slot_name) + "_" +_variant + "_" + _direction)!= false)  {
	_variant++



}
return _variant
}


