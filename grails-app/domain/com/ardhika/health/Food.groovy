package com.ardhika.health

class Food {

    static constraints = {
		name blank:false 
		foodGroup nullable:false 
		uom nullable:false 
		type inList : ['Processed', 'Raw']
		photo(nullable:true, maxSize:220000)
		nutrition nullable: false
		activeStatus inList : ['Yes', 'No']
    }
	
	static hasMany=[regionFood : RegionFood]
	static transients = ['regions']
	
	String name
	FoodGroup foodGroup
	UnitOfMeasurement uom
	String type
	byte[] photo
	String activeStatus = 'Yes'
	String catFoodCode
	Nutrition nutrition
	
	String toString(){
		"$name"
	}
	
	def getRegions(){
		return this.regionFood.collect {it.region}
	}
	
	def addToRegions(Region region, String foodName, String mealTime){
		RegionFood.link region, this, foodName, mealTime
		return this.regions
	}
	
	def removeFromRegions(Region region){
		RegionFood.unLink region, this
		return this.regions
	}
}
