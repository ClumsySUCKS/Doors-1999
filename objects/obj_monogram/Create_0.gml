on = false
firstpressed = false
image_speed = 0

// We wrap the toggle logic in a function so the network can trigger it too
toggle_state = function() {
    alarm[0] = 300;
    switch (on) {
        case false:
            on = true;
            image_speed = 1;
            audio_play_sound_at(sndef_monogram,x,y,0,32,150,1,false,4);
            if (firstpressed == false) {
                audio_play_sound_at(snd_relaxedscene,x,y,0,32,150,1,true,5);
            } else {
                audio_resume_sound(snd_relaxedscene);
            }
            firstpressed = true;
            break;
            
        case true:
            on = false;
            image_speed = 0;
            image_index = 0;
            audio_play_sound_at(sndef_monogram,x,y,0,32,150,1,false,4);
            audio_pause_sound(snd_relaxedscene);
            break;
    }
}