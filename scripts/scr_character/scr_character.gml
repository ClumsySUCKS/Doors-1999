enum PART {LEG_L, LEG_R, CHEST, ARM_L, ARM_R, HEAD, ACC_HIP, ACC_HEAD, ACC_FACE, COUNT}

function character_init() {
	global.part_names = ["legL", "legR", "chest", "armL", "armR","head", "accHip", "accHead", "accFace"]
	global.dir_letters = ["U","D","L","R"]
	global.part_cache = {}//up
	global.part_order = [[PART.LEG_L,PART.LEG_R, PART.CHEST, PART.ARM_L, PART.ARM_R, PART.ACC_HIP, PART.HEAD, PART.ACC_HEAD],
	[PART.LEG_L, PART.LEG_R, PART.CHEST, PART.ACC_HIP, PART.ARM_L, PART.ARM_R, PART.HEAD, PART.ACC_FACE, PART.ACC_HEAD], //down
	[PART.ARM_R,PART.LEG_R,PART.LEG_L,PART.CHEST,PART.ACC_HIP,PART.ARM_L,PART.HEAD,PART.ACC_FACE,PART.ACC_HEAD], //left
	[PART.ARM_L, PART.LEG_L, PART.LEG_R, PART.CHEST, PART.ACC_HIP, PART.ARM_R, PART.HEAD, PART.ACC_FACE, PART.ACC_HEAD]] //right
	global.u_outline = shader_get_uniform(sh_recolour, "u_outline")
	global.u_tint = shader_get_uniform(sh_recolour, "u_tint")}
	
function default_outfit(_member_index) {
	var _o = {
		v: array_create(PART.COUNT, 0),
		c: array_create(PART.COUNT, c_white),
		outline: (_member_index == 0) ? make_colour_rgb(0,0,0) : make_colour_rgb(0,0,0)}
			_o.v[PART.ACC_HIP] = -1
		_o.v[PART.ACC_HEAD] = -1
		_o.v[PART.ACC_FACE] = -1
		return _o}
		
function part_sprite(_slot, _variant, _facing) {
	var _key = global.part_names[_slot] + "_" + string(_variant) + "_" + global.dir_letters[_facing]
	var _spr = global.part_cache[$ _key]
	if (is_undefined(_spr)) {
		_spr = asset_get_index("spr_part_" + _key)
		global.part_cache[$ _key] = _spr
		if (_spr == -1) show_debug_message("Missing part sprite: spr_part_" + _key)}
		return _spr}
	
function draw_character(_x, _y, _facing, _frame, _alpha, _outfit) {
	var _drawn = 0
	shader_set(sh_recolour)
	shader_set_uniform_f(global.u_outline,colour_get_red(_outfit.outline) / 255, colour_get_green(_outfit.outline) / 255, colour_get_blue(_outfit.outline) / 255)
	var _order = global.part_order[_facing]
	for (var _i = 0; _i < array_length(_order); _i++) {
		var _slot =	_order[_i]
		var _v = _outfit.v[_slot]
		if (_v < 0) continue
		var _spr = part_sprite(_slot, _v, _facing)
		if (_spr == -1) continue
		var _c = outfit.c[_slot]
		shader_set_uniform_f(global.u_tint, colour_get_red(_c) / 255, colour_get_green(_c) / 255, colour_get_blue(_c) / 255)
		draw_sprite_ext(_spr, _frame, _x, _y, 1,1,0,c_white,_alpha)
		_drawn++}
		shader_reset()
		return _drawn}
