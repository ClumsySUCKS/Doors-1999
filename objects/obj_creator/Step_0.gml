if keyboard_check_pressed(ord("D")) {
	if col == 2 {col = 0 show_debug_message("row " + string(row) + " col " + string(col))}
	else {
	col++ show_debug_message("row " + string(row) + " col " + string(col))}}
if keyboard_check_pressed(ord("A")) {
if col == 0 {col = 2 show_debug_message("row " + string(row) + " col " + string(col))}
else {col-- show_debug_message("row " + string(row) + " col " + string(col))}}
if keyboard_check_pressed(ord("W")) {
if row == 0 {row = array_length(global.limb_names) show_debug_message("row " + string(row) + " col " + string(col))}
else {row-- show_debug_message("row " + string(row) + " col " + string(col))}}
if keyboard_check_pressed(ord("S")) {
if row == array_length(global.limb_names){row = 0 show_debug_message("row " + string(row) + " col " + string(col))}
else {row++ show_debug_message("row " + string(row) + " col " + string(col))}}
if row > 0 {sel = global.limb_names[row - 1]}
if keyboard_check_pressed(ord("E")) {if row > 0 {if col == 0 {outfit[$ sel] = outfit[$ sel] - 1
	show_debug_message("outfit." + sel + " is now " + string(outfit[$ sel]))}}}
if keyboard_check_pressed(ord("E")) {if row > 0 {if col == 0 {outfit[$ sel] = outfit[$ sel] + 1
show_debug_message("outfit." + sel + " is now " + string(outfit[$ sel]))}}}
	