depth = -100;
upgraded = 0;
bounced = 0;
target = 0;
target = instance_nearest(x,y,enemy);



if (!instance_exists(enemy)) {  
	instance_destroy();	
}