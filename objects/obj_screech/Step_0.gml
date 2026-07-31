if sprite_index == spr_screech1
{if obj_player.sprite_index == spr_player_standu or obj_player.sprite_index == spr_player_up
	{ global.screechJump = 1
		instance_destroy()
	}
}
if sprite_index == spr_screech2
{if obj_player.sprite_index == spr_player_standl or obj_player.sprite_index == spr_player_left
	{global.screechJump = 1
		instance_destroy()	
	}
		
}
if sprite_index == spr_screech3
{if obj_player.sprite_index == spr_player_standr or obj_player.sprite_index == spr_player_right
	{global.screechJump = 1
		instance_destroy()	
	}
	
}
if sprite_index == spr_screech4
{if obj_player.sprite_index == spr_player_standd or obj_player.sprite_index == spr_player_down
	{global.screechJump = 1
		instance_destroy()	
	}
}