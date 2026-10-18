audio_play_sound(snd_placeholdotd,3,true)
sndeffectmuff = audio_effect_create(AudioEffectType.LPF2)
sndeffectre = audio_effect_create(AudioEffectType.Reverb1)
sndeffectmuff.cutoff = 300
sndeffectre.mix = 0.5
audio_bus_main.effects[0] = sndeffectmuff
audio_bus_main.effects[1] = sndeffectre
audio_bus_main.bypass = true
