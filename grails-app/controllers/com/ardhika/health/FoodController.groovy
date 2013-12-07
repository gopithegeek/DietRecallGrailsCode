package com.ardhika.health

import com.ardhika.output.Response
import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class FoodController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [foodInstanceList: Food.list(params), foodInstanceTotal: Food.count()]
    }

    def create() {
        [foodInstance: new Food(params)]
    }

    def save() {
        def foodInstance = new Food(params)
        if (!foodInstance.save(flush: true)) {
            render(view: "create", model: [foodInstance: foodInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'food.label', default: 'Food'), foodInstance.id])
        redirect(action: "show", id: foodInstance.id)
    }

    def show(Long id) {
        def foodInstance = Food.get(id)
        if (!foodInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'food.label', default: 'Food'), id])
            redirect(action: "list")
            return
        }

        [foodInstance: foodInstance]
    }

    def edit(Long id) {
        def foodInstance = Food.get(id)
        if (!foodInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'food.label', default: 'Food'), id])
            redirect(action: "list")
            return
        }

        [foodInstance: foodInstance]
    }

    def update(Long id, Long version) {
        def foodInstance = Food.get(id)
        if (!foodInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'food.label', default: 'Food'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (foodInstance.version > version) {
                foodInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'food.label', default: 'Food')] as Object[],
                          "Another user has updated this Food while you were editing")
                render(view: "edit", model: [foodInstance: foodInstance])
                return
            }
        }

        foodInstance.properties = params

        if (!foodInstance.save(flush: true)) {
            render(view: "edit", model: [foodInstance: foodInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'food.label', default: 'Food'), foodInstance.id])
        redirect(action: "show", id: foodInstance.id)
    }

    def delete(Long id) {
        def foodInstance = Food.get(id)
        if (!foodInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'food.label', default: 'Food'), id])
            redirect(action: "list")
            return
        }

        try {
            foodInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'food.label', default: 'Food'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'food.label', default: 'Food'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def showImage() {
		def foodInstance = Food.get(params.id)
		if(foodInstance.photo){
			OutputStream out = response.getOutputStream()
			out.write(foodInstance.photo)
			out.close()
		}
	}
	
	def foodList(){
		def foodList =  Food.list()
		def responseBody = new Response()
		if(foodList){
			responseBody.code = 0
			responseBody.message = 'success'
			def rlist = []
			foodList.each {
				def food = [:]
				food.code = it.id
				food.name = it.name
				food.measure = it.uom.name
				rlist.push(food)
			}
			responseBody.packet = rlist
		}
		else {
			responseBody.code = 1
			responseBody.message = 'failed'
		}
		render responseBody as JSON
	}
}
