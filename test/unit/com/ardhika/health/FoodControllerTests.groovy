package com.ardhika.health



import org.junit.*
import grails.test.mixin.*

@TestFor(FoodController)
@Mock(Food)
class FoodControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/food/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.foodInstanceList.size() == 0
        assert model.foodInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.foodInstance != null
    }

    void testSave() {
        controller.save()

        assert model.foodInstance != null
        assert view == '/food/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/food/show/1'
        assert controller.flash.message != null
        assert Food.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/food/list'

        populateValidParams(params)
        def food = new Food(params)

        assert food.save() != null

        params.id = food.id

        def model = controller.show()

        assert model.foodInstance == food
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/food/list'

        populateValidParams(params)
        def food = new Food(params)

        assert food.save() != null

        params.id = food.id

        def model = controller.edit()

        assert model.foodInstance == food
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/food/list'

        response.reset()

        populateValidParams(params)
        def food = new Food(params)

        assert food.save() != null

        // test invalid parameters in update
        params.id = food.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/food/edit"
        assert model.foodInstance != null

        food.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/food/show/$food.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        food.clearErrors()

        populateValidParams(params)
        params.id = food.id
        params.version = -1
        controller.update()

        assert view == "/food/edit"
        assert model.foodInstance != null
        assert model.foodInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/food/list'

        response.reset()

        populateValidParams(params)
        def food = new Food(params)

        assert food.save() != null
        assert Food.count() == 1

        params.id = food.id

        controller.delete()

        assert Food.count() == 0
        assert Food.get(food.id) == null
        assert response.redirectedUrl == '/food/list'
    }
}
