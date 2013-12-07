package com.ardhika.health

class Nutrition {

    static constraints = {
		help nullable: true, blank: true
    }
	
	int weight
	float measure
	int measureSize
	int calories
	float protein
	float carbohydrate
	boolean isCarbohydrateRestricted
	float fat
	float saturatedFat
	float unsaturatedFat
	float fibre
	float monoUnsaturatedFat
	float sodiumContent
	boolean isSodiumRestricted
	float potassiumContent
	boolean isBedteaItem
	boolean isBreakfastItem
	boolean isMidmornSnackItem
	boolean isLunchItem
	boolean isEveningteaItem
	boolean isSnackseveItem
	boolean isDinnerItem
	boolean isBedtimeSnackItem
	int cerealExchange
	int pulseExchange
	int milkExchange
	int vegetableExchange
	int fruitExchange
	int fatExchange
	int meatExchange
	boolean isMilkRequired
	boolean isSugarRequired
	boolean isOilRequired
	boolean isDrinkRequired
	boolean addDrink
	boolean isPartOfDelhiDB
	boolean isPartOfKeralaDB
	boolean isPartOfLineItem
	String help
	
	static belongsTo = [Food]
	
	String toString(){
		"$help"
	}

}
