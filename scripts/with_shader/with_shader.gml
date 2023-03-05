function with_shader(shader_name, callback){
	shader_set(shader_name);
	
	callback();
	
	shader_reset();
}