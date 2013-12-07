package com.ardhika.health

class FoodGroup {

    static constraints = {
		name blank:false 
		code blank:false 
    }
	
	static hasMany=[foodList : Food]
		
	String name
	String code
	
	String toString(){
		"$name "+" $code"
	}
}
