package com.ardhika.health



import org.junit.*
import grails.test.mixin.*

@TestFor(MealTimeController)
@Mock(MealTime)
class MealTimeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/mealTime/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.mealTimeInstanceList.size() == 0
        assert model.mealTimeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.mealTimeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.mealTimeInstance != null
        assert view == '/mealTime/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/mealTime/show/1'
        assert controller.flash.message != null
        assert MealTime.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/mealTime/list'

        populateValidParams(params)
        def mealTime = new MealTime(params)

        assert mealTime.save() != null

        params.id = mealTime.id

        def model = controller.show()

        assert model.mealTimeInstance == mealTime
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/mealTime/list'

        populateValidParams(params)
        def mealTime = new MealTime(params)

        assert mealTime.save() != null

        params.id = mealTime.id

        def model = controller.edit()

        assert model.mealTimeInstance == mealTime
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/mealTime/list'

        response.reset()

        populateValidParams(params)
        def mealTime = new MealTime(params)

        assert mealTime.save() != null

        // test invalid parameters in update
        params.id = mealTime.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/mealTime/edit"
        assert model.mealTimeInstance != null

        mealTime.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/mealTime/show/$mealTime.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        mealTime.clearErrors()

        populateValidParams(params)
        params.id = mealTime.id
        params.version = -1
        controller.update()

        assert view == "/mealTime/edit"
        assert model.mealTimeInstance != null
        assert model.mealTimeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/mealTime/list'

        response.reset()

        populateValidParams(params)
        def mealTime = new MealTime(params)

        assert mealTime.save() != null
        assert MealTime.count() == 1

        params.id = mealTime.id

        controller.delete()

        assert MealTime.count() == 0
        assert MealTime.get(mealTime.id) == null
        assert response.redirectedUrl == '/mealTime/list'
    }
}
