package com.ardhika.health



import org.junit.*
import grails.test.mixin.*

@TestFor(UnitOfMeasurementController)
@Mock(UnitOfMeasurement)
class UnitOfMeasurementControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/unitOfMeasurement/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.unitOfMeasurementInstanceList.size() == 0
        assert model.unitOfMeasurementInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.unitOfMeasurementInstance != null
    }

    void testSave() {
        controller.save()

        assert model.unitOfMeasurementInstance != null
        assert view == '/unitOfMeasurement/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/unitOfMeasurement/show/1'
        assert controller.flash.message != null
        assert UnitOfMeasurement.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/unitOfMeasurement/list'

        populateValidParams(params)
        def unitOfMeasurement = new UnitOfMeasurement(params)

        assert unitOfMeasurement.save() != null

        params.id = unitOfMeasurement.id

        def model = controller.show()

        assert model.unitOfMeasurementInstance == unitOfMeasurement
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/unitOfMeasurement/list'

        populateValidParams(params)
        def unitOfMeasurement = new UnitOfMeasurement(params)

        assert unitOfMeasurement.save() != null

        params.id = unitOfMeasurement.id

        def model = controller.edit()

        assert model.unitOfMeasurementInstance == unitOfMeasurement
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/unitOfMeasurement/list'

        response.reset()

        populateValidParams(params)
        def unitOfMeasurement = new UnitOfMeasurement(params)

        assert unitOfMeasurement.save() != null

        // test invalid parameters in update
        params.id = unitOfMeasurement.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/unitOfMeasurement/edit"
        assert model.unitOfMeasurementInstance != null

        unitOfMeasurement.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/unitOfMeasurement/show/$unitOfMeasurement.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        unitOfMeasurement.clearErrors()

        populateValidParams(params)
        params.id = unitOfMeasurement.id
        params.version = -1
        controller.update()

        assert view == "/unitOfMeasurement/edit"
        assert model.unitOfMeasurementInstance != null
        assert model.unitOfMeasurementInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/unitOfMeasurement/list'

        response.reset()

        populateValidParams(params)
        def unitOfMeasurement = new UnitOfMeasurement(params)

        assert unitOfMeasurement.save() != null
        assert UnitOfMeasurement.count() == 1

        params.id = unitOfMeasurement.id

        controller.delete()

        assert UnitOfMeasurement.count() == 0
        assert UnitOfMeasurement.get(unitOfMeasurement.id) == null
        assert response.redirectedUrl == '/unitOfMeasurement/list'
    }
}
