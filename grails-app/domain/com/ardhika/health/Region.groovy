package com.ardhika.health

class Region {

    static constraints = {
		name blank:false
		code blank:false
    }
	
	String name
	String code
	static hasMany=[regionFood : RegionFood]
	static transients = ['food']
	
	String toString(){
		"$name"
	}
	
	def getFood(){
		return this.regionFood.collect {it.food}
	}
	
	def addToFood(Food food, String foodName, String mealTime){
		RegionFood.link this, food, foodName, mealTime
		return this.food
	}
	
	def removeFromFood(Food food){
		RegionFood.unLink this, food
		return this.food
	}

}
