if !isgrid {
if keyboard_check_pressed(ord("D")) {
	if col == 2 {col = 0 show_debug_message("row " + string(row) + " col " + string(col))}
	else {
	col++ show_debug_message("row " + string(row) + " col " + string(col))}}
if keyboard_check_pressed(ord("A")) {
if col == 0 {col = 2 show_debug_message("row " + string(row) + " col " + string(col))}
else {col-- show_debug_message("row " + string(row) + " col " + string(col))}}
if keyboard_check_pressed(ord("W")) {
if row == 0 {row = array_length(global.limbnames) show_debug_message("row " + string(row) + " col " + string(col))}
else {row-- show_debug_message("row " + string(row) + " col " + string(col))}}
if keyboard_check_pressed(ord("S")) {
if row == array_length(global.limbnames){row = 0 show_debug_message("row " + string(row) + " col " + string(col))}
else {row++ show_debug_message("row " + string(row) + " col " + string(col))}}
if row > 0 {sel = global.limbnames[row - 1]}
if keyboard_check_pressed(ord("Q")) {
	if mode == 2 {mode = 0}
	else {mode++}}
	
	
if keyboard_check_pressed(ord("E")) {	
if mode == 0 {
    if row > 0 
    {var low = 0
        if isaac(sel) {low = -1}
		sel = global.limbnames[row - 1]
		sel_pos = array_get_index(global.limbnames,sel)
        if col == 0 {if outfit[$ sel] == low {outfit[$ sel] = global.limbcount[sel_pos] - 1}
        else {
            outfit[$ sel] = outfit[$ sel] - 1}
    show_debug_message("outfit." + sel + " is now " + string(outfit[$ sel]))}
        if col == 1 {if outfit[$ sel] == global.limbcount[sel_pos] - 1 {outfit[$ sel] = low}
else {
outfit[$ sel] = outfit[$ sel] + 1}
show_debug_message("outfit." + sel + " is now " + string(outfit[$ sel]))}
		if col == 2 {isgrid = true}}

		else
		{if col == 0{
			if cur == 0{
				cur = array_length(global.chardef) - 1  show_debug_message(cur)
				outfit = variable_clone(global.chardef[cur]) show_debug_message(outfit)}
				else {cur-- show_debug_message(cur)
					outfit = variable_clone(global.chardef[cur]) show_debug_message(outfit)}}
		
			if col == 1{if cur == array_length(global.chardef) - 1{cur = 0 show_debug_message(cur)
				outfit = variable_clone(global.chardef[cur]) show_debug_message(outfit)}
			else {cur++ show_debug_message(cur)
				outfit = variable_clone(global.chardef[cur]) show_debug_message(outfit)}}
			if col == 2 {isgrid = true}}}
if mode == 1 {
	if row > 0 {sel = global.limbnames[row - 1]
		sel_pos = array_get_index(global.limbnames,sel)
		if col == 0 {
			if outfit.skin[sel_pos] == 0 {outfit.skin[sel_pos] = array_length(global.skin_pal) - 1}
			else {outfit.skin[sel_pos]--}}
		if col == 1 {
			if outfit.skin[sel_pos] == array_length(global.skin_pal) - 1 {outfit.skin[sel_pos] = 0}
			else {outfit.skin[sel_pos]++}}
		if col == 2 {isgrid = true}
			
}}
if mode == 2 {
	if row > 0 {sel = global.limbnames[row - 1]
		sel_pos = array_get_index(global.limbnames,sel)
		if col == 0 {
				if outfit.cloth[sel_pos] == 0 {outfit.cloth[sel_pos] = array_length(global.cloth_pal) - 1}
				else {outfit.cloth[sel_pos]--}}
		if col == 1 {
			if outfit.cloth[sel_pos] == array_length(global.cloth_pal) - 1 {outfit.cloth[sel_pos] = 0}
			else {outfit.cloth[sel_pos]++}}
		if col == 2 {isgrid = true}
}}}}
else {
		if row > 0 {sel_pos = array_get_index(global.limbnames,sel)}
		if row == 0 {count = array_length(global.chardef)}
		else {
			switch mode {
				case 0:
				count = global.limbcount[sel_pos]
				if isaac(sel) {count++}
				break
				case 1: count = array_length(global.skin_pal) break
				case 2: count = array_length(global.cloth_pal) break}}
		if keyboard_check_pressed(ord("F")) {isgrid = false grider = 0}
		if keyboard_check_pressed(ord("D")) {if grider == count - 1 {grider = 0}
											else {grider++}}
		if keyboard_check_pressed(ord("A")) {if grider == 0 {grider  = count - 1}
											else {grider--}}
		if keyboard_check_pressed(ord("S")) {if grider + boxer < count {grider += boxer} else {grider = grider mod boxer}}
		if keyboard_check_pressed(ord("W")) {if grider - boxer >= 0 {grider -= boxer} else {
			var colm = grider mod boxer
			var rows = (count + boxer - 1) div boxer
			var bottom = colm + (rows - 1) * boxer
			if bottom >= count {bottom -= boxer}
			grider = bottom}}
		if keyboard_check_pressed(ord("E")) {
			var v = grider
			if row == 0 {
				cur = grider
				outfit = variable_clone(global.chardef[cur])}
		else {
			switch mode {
				case 0:
				if isaac(sel) {v = grider - 1}
				outfit[$ sel] = v break
				case 1: outfit.skin[sel_pos] = grider break
				case 2: outfit.cloth[sel_pos] = grider break}}}}
global.defcreate = outfit