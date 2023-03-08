function FindOre(item1, rootObject){
	for (var i = 0; i < array_length(rootObject.ore_recipes); i++) { //7, 11, 0
	    if ((rootObject.ore_recipes[i].ore_type == item1)) {
	        //display the item you will get
			if (rootObject.inventory[1].amount == 0) {
				rootObject.inventory[1].itemInSlot = rootObject.ore_recipes[i].output_type;
			}
			
			//If the items in the crafting slot match with the recipe, start crafting
			if (rootObject.inventory[0].itemInSlot == rootObject.ore_recipes[i].ore_type) {	
				
				//Only craft if the furnace has 5 or more ore
				if (rootObject.inventory[0].amount >= rootObject.ore_recipes[i].ore_amount) {	
					crafting_timer += 0.06;
				}
			}
			
			//If you've crafted an item and the output items are different, stop crafting
			if (rootObject.inventory[1].amount != 0 and rootObject.inventory[1].itemInSlot != rootObject.ore_recipes[i].output_type) {
				crafting_timer = -1;	
			}
			
			//If crafting timer completes, update the amounts of each item
			if (crafting_timer >= 16) {
				crafted = true;
				rootObject.inventory[1].amount += rootObject.ore_recipes[i].output_amount;
	
				if (rootObject.inventory[0].itemInSlot != item.none) {
					rootObject.inventory[0].amount -= rootObject.ore_recipes[i].ore_amount; //amounts
				}
	
				//If the first slot crafting item reaches zero, remove the item
				if (rootObject.inventory[0].amount == 0) {
					rootObject.inventory[0].itemInSlot = item.none;
				}
				crafting_timer = 0;	
			}

			//set crafted to false if the output item doesnt have a value greater than 0
			if (rootObject.inventory[1].amount == 0) {
				crafted = false;
			}
		
	        break; //break after finding the correct recipe so the game stops searching
	    }
	}
}