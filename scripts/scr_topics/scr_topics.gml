global.topics = {};


global.topics[$ "Example"] = [
	TEXT("Hello World"),
	TEXT("I sure hope this dialogue system works first try!"),
	TEXT("Now I'm testing if a page with alot of words will properly line break or not. Maybe it will, maybe it wont.")
];


global.topics[$ "Good Morning"] = [
	SPEAKER("Old Man", spr_portrait_oldman, PORTRAIT_SIDE.LEFT),
	TEXT("Good morning! How are you today?"),
	SPEAKER("Player", spr_portrait_player, PORTRAIT_SIDE.LEFT),
	TEXT("I'm doing well, how about you?"),
	SPEAKER("Old Man", spr_portrait_oldman, PORTRAIT_SIDE.LEFT),
	TEXT("I can't complain, execpt for one thing..."),
	TEXT("My potion turned my staff into a blue!")
];

global.topics[$ "Breakfast"] = [
	SPEAKER("Oldman", spr_portrait_oldman, PORTRAIT_SIDE.LEFT),
	CHOICE("What do you want for breakfast?",
		OPTION("Eggs probably", "Chose Eggs"),
		OPTION("Pancakes probably, limit test", "Chose Pancakes"))
];

global.topics[$ "Chose Eggs"] = [
	TEXT("That's a healthy way to start the day!"),
	GOTO("End of Breakfast")
];

global.topics[$ "Chose Pancakes"] = [
	TEXT("Ooh, yummy!"),
	GOTO("End of Breakfast")
];

global.topics[$ "End of Breakfast"] = [
	TEXT("Goodbye, now!")
];