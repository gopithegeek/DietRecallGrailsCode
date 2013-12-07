package com.ardhika.health



import org.junit.*
import grails.test.mixin.*

@TestFor(NutritionController)
@Mock(Nutrition)
class NutritionControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/nutrition/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.nutritionInstanceList.size() == 0
        assert model.nutritionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.nutritionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.nutritionInstance != null
        assert view == '/nutrition/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/nutrition/show/1'
        assert controller.flash.message != null
        assert Nutrition.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/nutrition/list'

        populateValidParams(params)
        def nutrition = new Nutrition(params)

        assert nutrition.save() != null

        params.id = nutrition.id

        def model = controller.show()

        assert model.nutritionInstance == nutrition
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/nutrition/list'

        populateValidParams(params)
        def nutrition = new Nutrition(params)

        assert nutrition.save() != null

        params.id = nutrition.id

        def model = controller.edit()

        assert model.nutritionInstance == nutrition
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/nutrition/list'

        response.reset()

        populateValidParams(params)
        def nutrition = new Nutrition(params)

        assert nutrition.save() != null

        // test invalid parameters in update
        params.id = nutrition.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/nutrition/edit"
        assert model.nutritionInstance != null

        nutrition.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/nutrition/show/$nutrition.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        nutrition.clearErrors()

        populateValidParams(params)
        params.id = nutrition.id
        params.version = -1
        controller.update()

        assert view == "/nutrition/edit"
        assert model.nutritionInstance != null
        assert model.nutritionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/nutrition/list'

        response.reset()

        populateValidParams(params)
        def nutrition = new Nutrition(params)

        assert nutrition.save() != null
        assert Nutrition.count() == 1

        params.id = nutrition.id

        controller.delete()

        assert Nutrition.count() == 0
        assert Nutrition.get(nutrition.id) == null
        assert response.redirectedUrl == '/nutrition/list'
    }
}
