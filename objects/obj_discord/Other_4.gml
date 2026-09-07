textdis = string_replace_all(string_format(global.doorcountdiscord,4,0)," ","0")
if room != rm_reception {np_setpresence("At Door " + textdis, string(discordmessagechoose), "hotelpresence", "doors_1999_title_bgs")}

