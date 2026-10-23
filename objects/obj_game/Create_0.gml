global.playerupsprites = [spr_charanoobU,spr_chara_av_U] 
global.playerupstandsprites = [spr_charanoob_standU,spr_chara_av_standU]
global.playerdownsprites = [spr_charanoobD,spr_chara_av_D]
global.playerdownstandsprites = [spr_charanoob_standD,spr_chara_av_standD]
global.playerleftsprites = [spr_charanoobL,spr_chara_av_L]
global.playerleftstandsprites = [spr_charanoob_standL,spr_chara_av_standL]
global.playerrightsprites = [spr_charanoobR,spr_chara_av_R]
global.playerrightstandsprites = [spr_charanoob_standR,spr_chara_av_standR]
c = #EFD600            //1      //2   //3     //4     //5     //6     //7     //8      //9    //10    //11     //12   //13    //14     
global.skin_pal = [c,#002A6A,#50AD00,#EED9BF,#67A4E0,#000000,#2D2D2D,#560000,#750000,#F26522,#BA4C1A,#191919,#1C1107,#3D240F,#FFFFFF]
					    //1      //2    //3    //4     //5     //6     //7     //8      //9     //10   //11    //12   //13    //14
global.cloth_pal = [c,#002A6A,#50AD00,#EED9BF,#67A4E0,#000000,#2D2D2D,#560000,#750000,#F26522,#BA4C1A,#191919,#1C1107,#3D240F,#FFFFFF]
					  //1     //2     //3     //4     //5     //6     //7     //8     //9     //10    //11    //12   //13    //14
global.out_pal = [c,#002A6A,#50AD00,#EED9BF,#67A4E0,#000000,#2D2D2D,#560000,#750000,#F26522,#BA4C1A,#191919,#1C1107,#3D240F,#FFFFFF]
global.player_name = "Player123"
global.partorder = {D: ["chest","legL","legR","hip_acc","armL","armR","head","mouth","eyesL","eyesR","face_acc","head_acc"], U: ["eyesL","eyesR","chest","legL","legR","hip_acc","armL","armR","head","mouth","face_acc","head_acc"],
	L: ["eyesR","legL","legR","hip_acc","chest","armL","head","mouth","eyesL","face_acc","head_acc","armR"], R: ["eyesL","legR","legL","hip_acc","chest","armR","head","mouth","eyesR","face_acc","head_acc","armL"]}
global.chardef = [{legL:0, legR:0, hip_acc:-1,armL:0,armR:0,chest:0,head:0,mouth:-1,eyesL:0,eyesR:0,face_acc:-1,head_acc:-1,skin:[2,2,1,0,0,0,0,1,1,0,0,0],cloth:array_create(12,0),outline:1},
{legL:1, legR:1, hip_acc:2,armL:1,armR:1,chest:1,head:1,mouth:0,eyesL:-1,eyesR:-1,face_acc:-1,head_acc:-1,skin:[0,0,0,3,3,8,0,0,0,0,0,0],cloth:[7,7,7,7,7,6,0,0,0,5,0,0],outline:6},
 {legL:2,legR:2,hip_acc:-1,armL:2,armR:2,chest:2,head:2,mouth:1,eyesL:1,eyesR:2,face_acc:-1,head_acc:0,skin:[12,12,13,12,12,12,5,14,14,0,0,9],cloth:[11,11,12,0,0,0,14,5,5,0,0,10],outline:12}]
global.limbnames = ["legL","legR","chest","armL","armR","head","mouth","eyesL","eyesR","hip_acc","face_acc","head_acc"]
global.limbcount = [3,3,3,3,3,3,1,2,2,1,0,1]
global.charatint = shader_get_uniform(sh_playercolours, "u_tint")
global.charaline = shader_get_uniform(sh_playercolours,"u_outline")
global.charaskin = shader_get_uniform(sh_playercolours, "u_skin")
global.characloth = shader_get_uniform(sh_playercolours, "u_cloth")

