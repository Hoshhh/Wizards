draw_sprite_part(
	spr_crops, 0, 
	growthStage*frameWidth, 
	cropType*frameHeight,
	16,32,xx,yy
)


//Draw Sparkle
if (sparkle >= 0) {
	draw_sprite(spr_sparkle, sparkle, x+1, y-5)
	sparkle += 0.1;
	
	if (sparkle >= sprite_get_number(spr_sparkle)) {
		sparkle = -1;	
		alarm[1] = random_range(4,5) * room_speed
	}
}

//draw_text(x,y-32, string(daysWithoutWater))