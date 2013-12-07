package com.ardhika.health

import org.springframework.dao.DataIntegrityViolationException

class RegionFoodController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [regionFoodInstanceList: RegionFood.list(params), regionFoodInstanceTotal: RegionFood.count()]
    }

    def create() {
        [regionFoodInstance: new RegionFood(params)]
    }

    def save() {
        def regionFoodInstance = new RegionFood(params)
        if (!regionFoodInstance.save(flush: true)) {
            render(view: "create", model: [regionFoodInstance: regionFoodInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'regionFood.label', default: 'RegionFood'), regionFoodInstance.id])
        redirect(action: "show", id: regionFoodInstance.id)
    }

    def show(Long id) {
        def regionFoodInstance = RegionFood.get(id)
        if (!regionFoodInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regionFood.label', default: 'RegionFood'), id])
            redirect(action: "list")
            return
        }

        [regionFoodInstance: regionFoodInstance]
    }

    def edit(Long id) {
        def regionFoodInstance = RegionFood.get(id)
        if (!regionFoodInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regionFood.label', default: 'RegionFood'), id])
            redirect(action: "list")
            return
        }

        [regionFoodInstance: regionFoodInstance]
    }

    def update(Long id, Long version) {
        def regionFoodInstance = RegionFood.get(id)
        if (!regionFoodInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regionFood.label', default: 'RegionFood'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (regionFoodInstance.version > version) {
                regionFoodInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'regionFood.label', default: 'RegionFood')] as Object[],
                          "Another user has updated this RegionFood while you were editing")
                render(view: "edit", model: [regionFoodInstance: regionFoodInstance])
                return
            }
        }

        regionFoodInstance.properties = params

        if (!regionFoodInstance.save(flush: true)) {
            render(view: "edit", model: [regionFoodInstance: regionFoodInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'regionFood.label', default: 'RegionFood'), regionFoodInstance.id])
        redirect(action: "show", id: regionFoodInstance.id)
    }

    def delete(Long id) {
        def regionFoodInstance = RegionFood.get(id)
        if (!regionFoodInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'regionFood.label', default: 'RegionFood'), id])
            redirect(action: "list")
            return
        }

        try {
            regionFoodInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'regionFood.label', default: 'RegionFood'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'regionFood.label', default: 'RegionFood'), id])
            redirect(action: "show", id: id)
        }
    }
}
