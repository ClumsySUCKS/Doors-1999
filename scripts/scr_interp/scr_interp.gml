#macro INTERP_DELAY = 100

function pos_buffer_push(_char, _x, _y) {
	if (!variable_instance_exists(_char, "pos_buffer")) {_char.pos_buffer = []}
	array_push(_char.pos_buffer, {x:_x, y:_y, t:current_time})
	if (array_length(_char.pos_buffer) > 8) {array_delete(_char.pos_buffer,0,1)}}
	
	
function pos_buffer_sample(_buf, _render_time) {
	var _n = array_length(_buf)
	if (_n == 0) return undefined
	if (_n == 1) return {x:_buf[0].x, y:_buf[0].y}
	if (_render_time <= _buf[0].t) return {x:_buf[_n-1].x, y:_buf[0].y}
	if (_render_time >= _buf[_n-1].t) return {x:_buf[_n-1].x, y:_buf[_n-1].y}
	for (var _i = 0; _i < _n - 1; _i++) {
		var _a = _buf[_i]
		var	_b = _buf[_i+1]
		if (_render_time >= _a.t && _render_time <= _b.t) {
			var _span = _b.t - _a.t 
			var _f = (_span <= 0) ? 1 : (_render_time - _a.t) / _span
			return {x: lerp(_a.x, _b.x, _f), y: lerp(_a.y, _b.y, _f)}}}
			return {x:_buf[_n-1].x, y:_buf[_n-1].y}}