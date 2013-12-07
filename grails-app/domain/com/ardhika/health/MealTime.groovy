package com.ardhika.health

class MealTime {

    static constraints = {
		name blank:false
    }
	
	String name
	
	String toString(){
		"$name"
	}
}
