package com.ardhika.health

class RegionFood {

    static constraints = {
		foodName blank:false 
		mealTime nullable:false 
		region nullable:false 
		food nullable:false
    }
	
	String foodName
	Date mealTime
	static belongsTo = [region: Region, food: Food]
	
	static RegionFood link(Region region, Food food, String foodName, String mealTime){
		def ref = RegionFood.findByRegionAndFood(region,food)
		if(!ref) {
			ref = new RegionFood()
			ref.foodName = foodName
			ref.mealTime = mealTime
			region?.addToRegionFood(ref)
			food?.addToRegionFood(ref)
			ref.save()
		}
		return ref
	}
	
	static void unLink(Region region, Food food){
		def ref = RegionFood.findByRegionAndFood(region,food)
		if(ref){
			region?.removeFromRegionFood(ref)
			food?.removeFromRegionFood(ref)
			ref.delete();
		}
	}
}
