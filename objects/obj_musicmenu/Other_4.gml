if room == rm_characreator {audio_bus_main.bypass = false}
else {audio_bus_main.bypass = true}
if room != rm_characreator or room != rm_hotelmenu {instance_destroy()}
if global.rom == rm_characreator {audio_play_sound(snd_splash,6,false)}