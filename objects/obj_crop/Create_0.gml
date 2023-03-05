collideable = false;

frameWidth = 16;
frameHeight = 32;

cropType = 0;
daysOld = 0;
growthStage = 0;
growthStageDuration = 0;
maxGrowthStage = sprite_get_width(spr_crops) / frameWidth - 1;
item_produced = -1;

fullyGrown = false;
sparkle = -1;

xx = x-(frameWidth/2)+2;
yy = y-frameHeight+6

watered = false;
gridx = 0;
gridy = 0;

daysWithoutWater = 0;