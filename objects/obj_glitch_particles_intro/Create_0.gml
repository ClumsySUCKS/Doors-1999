particles = [spr_g1,spr_g2,spr_g3,spr_g4,spr_g5,spr_g6,spr_g7,spr_g8,spr_g10,spr_g11,spr_g12]
chosen = irandom(10)
if irandom(200) == 200 {
	sprite_index = spr_g9}
else {
	sprite_index = particles[chosen]
}