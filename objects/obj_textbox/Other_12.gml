//[script, arg0, arg1...]
if (is_array(scripts))
{
	var pagescript = scripts[page];
	test = scripts[page];
	if (choice_dialogue) pagescript = pagescript[choice];
	if (pagescript != -1)
	{
		var len = array_length(pagescript)
		if (len == 1) 
		{ 
			script_execute(pagescript[0]);
		}
		else
		{
			var _len = array_length(pagescript);
			var args = array_create(len-1, 0);
			array_copy(args, 0, pagescript, 1, len-1);
			//var args_len = array_length(args)
			//for (var i = 0; i <
			script_execute_ext(pagescript[0], args)
		}
	}
}