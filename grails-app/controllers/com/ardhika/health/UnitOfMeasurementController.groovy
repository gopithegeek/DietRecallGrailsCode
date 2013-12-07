package com.ardhika.health

import org.springframework.dao.DataIntegrityViolationException

class UnitOfMeasurementController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [unitOfMeasurementInstanceList: UnitOfMeasurement.list(params), unitOfMeasurementInstanceTotal: UnitOfMeasurement.count()]
    }

    def create() {
        [unitOfMeasurementInstance: new UnitOfMeasurement(params)]
    }

    def save() {
        def unitOfMeasurementInstance = new UnitOfMeasurement(params)
        if (!unitOfMeasurementInstance.save(flush: true)) {
            render(view: "create", model: [unitOfMeasurementInstance: unitOfMeasurementInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'unitOfMeasurement.label', default: 'UnitOfMeasurement'), unitOfMeasurementInstance.id])
        redirect(action: "show", id: unitOfMeasurementInstance.id)
    }

    def show(Long id) {
        def unitOfMeasurementInstance = UnitOfMeasurement.get(id)
        if (!unitOfMeasurementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'unitOfMeasurement.label', default: 'UnitOfMeasurement'), id])
            redirect(action: "list")
            return
        }

        [unitOfMeasurementInstance: unitOfMeasurementInstance]
    }

    def edit(Long id) {
        def unitOfMeasurementInstance = UnitOfMeasurement.get(id)
        if (!unitOfMeasurementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'unitOfMeasurement.label', default: 'UnitOfMeasurement'), id])
            redirect(action: "list")
            return
        }

        [unitOfMeasurementInstance: unitOfMeasurementInstance]
    }

    def update(Long id, Long version) {
        def unitOfMeasurementInstance = UnitOfMeasurement.get(id)
        if (!unitOfMeasurementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'unitOfMeasurement.label', default: 'UnitOfMeasurement'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (unitOfMeasurementInstance.version > version) {
                unitOfMeasurementInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'unitOfMeasurement.label', default: 'UnitOfMeasurement')] as Object[],
                          "Another user has updated this UnitOfMeasurement while you were editing")
                render(view: "edit", model: [unitOfMeasurementInstance: unitOfMeasurementInstance])
                return
            }
        }

        unitOfMeasurementInstance.properties = params

        if (!unitOfMeasurementInstance.save(flush: true)) {
            render(view: "edit", model: [unitOfMeasurementInstance: unitOfMeasurementInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'unitOfMeasurement.label', default: 'UnitOfMeasurement'), unitOfMeasurementInstance.id])
        redirect(action: "show", id: unitOfMeasurementInstance.id)
    }

    def delete(Long id) {
        def unitOfMeasurementInstance = UnitOfMeasurement.get(id)
        if (!unitOfMeasurementInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'unitOfMeasurement.label', default: 'UnitOfMeasurement'), id])
            redirect(action: "list")
            return
        }

        try {
            unitOfMeasurementInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'unitOfMeasurement.label', default: 'UnitOfMeasurement'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'unitOfMeasurement.label', default: 'UnitOfMeasurement'), id])
            redirect(action: "show", id: id)
        }
    }
}
