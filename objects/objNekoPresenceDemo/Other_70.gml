/// @description Capture async events from NekoPresence.

var ev_type = async_load[? "event_type"];

if (ev_type == "DiscordReady")
{
	global.discord_initialized = true;
	
	window_set_caption("Doors 1999");
	ready = true;
	show_debug_message("date: " + string(date_current_datetime()));
	np_setpresence_timestamps(date_current_datetime(), 0, false);
	np_setpresence_more("Small image text", "Large image text", false);
	// bruh
	// np_setpresence_buttons(0, "Kremlin", "https://kremlin.ru");
	// np_setpresence_buttons(1, "Russian Facebook", "https://vk.com/");
	// DISCORD_MAX_BUTTONS == 2, so only allowed IDs are 0 and 1.
	
	//np_setpresence() should ALWAYS come the last!!
	if room == rm_hotelmenu {
	np_setpresence("Playing", "In Limbo's Menu", "doors_1999_title_dgs", "doors_1999_title_dgs");}
	
	
	

}