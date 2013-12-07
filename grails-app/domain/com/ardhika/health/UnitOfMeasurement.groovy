package com.ardhika.health

class UnitOfMeasurement {

    static constraints = {
		name blank: false
		code blank: false
    }
	
	String name
	String code
	
	String toString(){
		"$name "+" $code"
	}
}
