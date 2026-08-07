if sprite_index == spr_screech1
{if obj_player.sprite_index == spr_charanoob_standU or obj_player.sprite_index == spr_charanoobU
	{ global.screechJump = 1
		instance_destroy()
	}
}
if sprite_index == spr_screech2
{if obj_player.sprite_index == spr_charanoob_standL or obj_player.sprite_index == spr_charanoobL
	{global.screechJump = 1
		instance_destroy()	
	}
		
}
if sprite_index == spr_screech3
{if obj_player.sprite_index == spr_charanoob_standR or obj_player.sprite_index == spr_charanoobR
	{global.screechJump = 1
		instance_destroy()	
	}
	
}
if sprite_index == spr_screech4
{if obj_player.sprite_index == spr_charanoob_standD or obj_player.sprite_index == spr_charanoobD
	{global.screechJump = 1
		instance_destroy()	
	}
}