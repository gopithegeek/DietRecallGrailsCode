package com.ardhika.health



import org.junit.*
import grails.test.mixin.*

@TestFor(FoodGroupController)
@Mock(FoodGroup)
class FoodGroupControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/foodGroup/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.foodGroupInstanceList.size() == 0
        assert model.foodGroupInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.foodGroupInstance != null
    }

    void testSave() {
        controller.save()

        assert model.foodGroupInstance != null
        assert view == '/foodGroup/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/foodGroup/show/1'
        assert controller.flash.message != null
        assert FoodGroup.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/foodGroup/list'

        populateValidParams(params)
        def foodGroup = new FoodGroup(params)

        assert foodGroup.save() != null

        params.id = foodGroup.id

        def model = controller.show()

        assert model.foodGroupInstance == foodGroup
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/foodGroup/list'

        populateValidParams(params)
        def foodGroup = new FoodGroup(params)

        assert foodGroup.save() != null

        params.id = foodGroup.id

        def model = controller.edit()

        assert model.foodGroupInstance == foodGroup
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/foodGroup/list'

        response.reset()

        populateValidParams(params)
        def foodGroup = new FoodGroup(params)

        assert foodGroup.save() != null

        // test invalid parameters in update
        params.id = foodGroup.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/foodGroup/edit"
        assert model.foodGroupInstance != null

        foodGroup.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/foodGroup/show/$foodGroup.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        foodGroup.clearErrors()

        populateValidParams(params)
        params.id = foodGroup.id
        params.version = -1
        controller.update()

        assert view == "/foodGroup/edit"
        assert model.foodGroupInstance != null
        assert model.foodGroupInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/foodGroup/list'

        response.reset()

        populateValidParams(params)
        def foodGroup = new FoodGroup(params)

        assert foodGroup.save() != null
        assert FoodGroup.count() == 1

        params.id = foodGroup.id

        controller.delete()

        assert FoodGroup.count() == 0
        assert FoodGroup.get(foodGroup.id) == null
        assert response.redirectedUrl == '/foodGroup/list'
    }
}
