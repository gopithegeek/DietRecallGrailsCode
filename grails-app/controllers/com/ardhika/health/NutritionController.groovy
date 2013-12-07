package com.ardhika.health

import org.springframework.dao.DataIntegrityViolationException

class NutritionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [nutritionInstanceList: Nutrition.list(params), nutritionInstanceTotal: Nutrition.count()]
    }

    def create() {
        [nutritionInstance: new Nutrition(params)]
    }

    def save() {
        def nutritionInstance = new Nutrition(params)
        if (!nutritionInstance.save(flush: true)) {
            render(view: "create", model: [nutritionInstance: nutritionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'nutrition.label', default: 'Nutrition'), nutritionInstance.id])
        redirect(action: "show", id: nutritionInstance.id)
    }

    def show(Long id) {
        def nutritionInstance = Nutrition.get(id)
        if (!nutritionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'nutrition.label', default: 'Nutrition'), id])
            redirect(action: "list")
            return
        }

        [nutritionInstance: nutritionInstance]
    }

    def edit(Long id) {
        def nutritionInstance = Nutrition.get(id)
        if (!nutritionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'nutrition.label', default: 'Nutrition'), id])
            redirect(action: "list")
            return
        }

        [nutritionInstance: nutritionInstance]
    }

    def update(Long id, Long version) {
        def nutritionInstance = Nutrition.get(id)
        if (!nutritionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'nutrition.label', default: 'Nutrition'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (nutritionInstance.version > version) {
                nutritionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'nutrition.label', default: 'Nutrition')] as Object[],
                          "Another user has updated this Nutrition while you were editing")
                render(view: "edit", model: [nutritionInstance: nutritionInstance])
                return
            }
        }

        nutritionInstance.properties = params

        if (!nutritionInstance.save(flush: true)) {
            render(view: "edit", model: [nutritionInstance: nutritionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'nutrition.label', default: 'Nutrition'), nutritionInstance.id])
        redirect(action: "show", id: nutritionInstance.id)
    }

    def delete(Long id) {
        def nutritionInstance = Nutrition.get(id)
        if (!nutritionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'nutrition.label', default: 'Nutrition'), id])
            redirect(action: "list")
            return
        }

        try {
            nutritionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'nutrition.label', default: 'Nutrition'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'nutrition.label', default: 'Nutrition'), id])
            redirect(action: "show", id: id)
        }
    }
}
