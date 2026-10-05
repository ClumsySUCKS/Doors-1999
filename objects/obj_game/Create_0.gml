global.playerupsprites = [spr_charanoobU,spr_chara_av_U] 
global.playerupstandsprites = [spr_charanoob_standU,spr_chara_av_standU]
global.playerdownsprites = [spr_charanoobD,spr_chara_av_D]
global.playerdownstandsprites = [spr_charanoob_standD,spr_chara_av_standD]
global.playerleftsprites = [spr_charanoobL,spr_chara_av_L]
global.playerleftstandsprites = [spr_charanoob_standL,spr_chara_av_standL]
global.playerrightsprites = [spr_charanoobR,spr_chara_av_R]
global.playerrightstandsprites = [spr_charanoob_standR,spr_chara_av_standR]
global.skin_pal = [c_aqua,c_blue,c_lime,c_orange]
global.cloth_pal = [c_aqua,c_blue,c_lime,c_orange]
global.out_pal = [c_aqua,c_blue,c_lime,c_orange]
global.player_name = "Player123"
global.part_order = {D: ["legL","legR","hip_acc","chest","armL","armR","head","eyesL","eyesR","face_acc","head_acc"], U: ["eyesL","eyesR","legL","legR","hip_acc","chest","armL","armR","head","face_acc","head_acc"],
	L: ["eyesR","legL","legR","hip_acc","armL","chest","head","eyesL","face_acc","head_acc","armR"], R: ["eyesL","legR","legL","hip_acc","armR","chest","head","eyesR","face_acc","head_acc","armL"]}
global.limb_names = ["legL","legR","chest","armL","armR","head","eyesL","eyesR","hip_acc","face_acc","head_acc"]
global.charatint = shader_get_uniform(sh_playercolours, "u_tint")
global.charaline = shader_get_uniform(sh_playercolours,"u_outline")
global.charaskin = shader_get_uniform(sh_playercolours, "u_skin")
global.characloth = shader_get_uniform(sh_playercolours, "u_cloth")

