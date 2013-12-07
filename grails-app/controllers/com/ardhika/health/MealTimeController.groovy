package com.ardhika.health

import org.springframework.dao.DataIntegrityViolationException

class MealTimeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [mealTimeInstanceList: MealTime.list(params), mealTimeInstanceTotal: MealTime.count()]
    }

    def create() {
        [mealTimeInstance: new MealTime(params)]
    }

    def save() {
        def mealTimeInstance = new MealTime(params)
        if (!mealTimeInstance.save(flush: true)) {
            render(view: "create", model: [mealTimeInstance: mealTimeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'mealTime.label', default: 'MealTime'), mealTimeInstance.id])
        redirect(action: "show", id: mealTimeInstance.id)
    }

    def show(Long id) {
        def mealTimeInstance = MealTime.get(id)
        if (!mealTimeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mealTime.label', default: 'MealTime'), id])
            redirect(action: "list")
            return
        }

        [mealTimeInstance: mealTimeInstance]
    }

    def edit(Long id) {
        def mealTimeInstance = MealTime.get(id)
        if (!mealTimeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mealTime.label', default: 'MealTime'), id])
            redirect(action: "list")
            return
        }

        [mealTimeInstance: mealTimeInstance]
    }

    def update(Long id, Long version) {
        def mealTimeInstance = MealTime.get(id)
        if (!mealTimeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mealTime.label', default: 'MealTime'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (mealTimeInstance.version > version) {
                mealTimeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'mealTime.label', default: 'MealTime')] as Object[],
                          "Another user has updated this MealTime while you were editing")
                render(view: "edit", model: [mealTimeInstance: mealTimeInstance])
                return
            }
        }

        mealTimeInstance.properties = params

        if (!mealTimeInstance.save(flush: true)) {
            render(view: "edit", model: [mealTimeInstance: mealTimeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'mealTime.label', default: 'MealTime'), mealTimeInstance.id])
        redirect(action: "show", id: mealTimeInstance.id)
    }

    def delete(Long id) {
        def mealTimeInstance = MealTime.get(id)
        if (!mealTimeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'mealTime.label', default: 'MealTime'), id])
            redirect(action: "list")
            return
        }

        try {
            mealTimeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'mealTime.label', default: 'MealTime'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'mealTime.label', default: 'MealTime'), id])
            redirect(action: "show", id: id)
        }
    }
}
