package com.ardhika.health

import com.ardhika.output.Response
import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class FoodGroupController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [foodGroupInstanceList: FoodGroup.list(params), foodGroupInstanceTotal: FoodGroup.count()]
    }

    def create() {
        [foodGroupInstance: new FoodGroup(params)]
    }

    def save() {
        def foodGroupInstance = new FoodGroup(params)
        if (!foodGroupInstance.save(flush: true)) {
            render(view: "create", model: [foodGroupInstance: foodGroupInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'foodGroup.label', default: 'FoodGroup'), foodGroupInstance.id])
        redirect(action: "show", id: foodGroupInstance.id)
    }

    def show(Long id) {
        def foodGroupInstance = FoodGroup.get(id)
        if (!foodGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'foodGroup.label', default: 'FoodGroup'), id])
            redirect(action: "list")
            return
        }

        [foodGroupInstance: foodGroupInstance]
    }

    def edit(Long id) {
        def foodGroupInstance = FoodGroup.get(id)
        if (!foodGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'foodGroup.label', default: 'FoodGroup'), id])
            redirect(action: "list")
            return
        }

        [foodGroupInstance: foodGroupInstance]
    }

    def update(Long id, Long version) {
        def foodGroupInstance = FoodGroup.get(id)
        if (!foodGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'foodGroup.label', default: 'FoodGroup'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (foodGroupInstance.version > version) {
                foodGroupInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'foodGroup.label', default: 'FoodGroup')] as Object[],
                          "Another user has updated this FoodGroup while you were editing")
                render(view: "edit", model: [foodGroupInstance: foodGroupInstance])
                return
            }
        }

        foodGroupInstance.properties = params

        if (!foodGroupInstance.save(flush: true)) {
            render(view: "edit", model: [foodGroupInstance: foodGroupInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'foodGroup.label', default: 'FoodGroup'), foodGroupInstance.id])
        redirect(action: "show", id: foodGroupInstance.id)
    }

    def delete(Long id) {
        def foodGroupInstance = FoodGroup.get(id)
        if (!foodGroupInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'foodGroup.label', default: 'FoodGroup'), id])
            redirect(action: "list")
            return
        }

        try {
            foodGroupInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'foodGroup.label', default: 'FoodGroup'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'foodGroup.label', default: 'FoodGroup'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def foodGroupList(){
		def foodGroupList = FoodGroup.list()
		def responseBody = new Response()
		if(foodGroupList){
			responseBody.code = 0
			responseBody.message = 'success'
			def rlist = []
			foodGroupList.each {
				def foodGroup = [:]
				foodGroup.value = it.code
				foodGroup.text = it.name
				rlist.push(foodGroup)
			}
			responseBody.packet = rlist
		}
		else {
			responseBody.code = 1
			responseBody.message = 'failed'
		}
		render responseBody as JSON
	}
	
	def foodListForGroup(){
		def foodGroup = FoodGroup.findByCode(params.code)
		def foodList = foodGroup.foodList
		def responseBody = new Response()
		if(foodGroup){
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
