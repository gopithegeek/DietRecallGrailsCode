package com.ardhika.health



import org.junit.*
import grails.test.mixin.*

@TestFor(RegionFoodController)
@Mock(RegionFood)
class RegionFoodControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/regionFood/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.regionFoodInstanceList.size() == 0
        assert model.regionFoodInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.regionFoodInstance != null
    }

    void testSave() {
        controller.save()

        assert model.regionFoodInstance != null
        assert view == '/regionFood/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/regionFood/show/1'
        assert controller.flash.message != null
        assert RegionFood.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/regionFood/list'

        populateValidParams(params)
        def regionFood = new RegionFood(params)

        assert regionFood.save() != null

        params.id = regionFood.id

        def model = controller.show()

        assert model.regionFoodInstance == regionFood
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/regionFood/list'

        populateValidParams(params)
        def regionFood = new RegionFood(params)

        assert regionFood.save() != null

        params.id = regionFood.id

        def model = controller.edit()

        assert model.regionFoodInstance == regionFood
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/regionFood/list'

        response.reset()

        populateValidParams(params)
        def regionFood = new RegionFood(params)

        assert regionFood.save() != null

        // test invalid parameters in update
        params.id = regionFood.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/regionFood/edit"
        assert model.regionFoodInstance != null

        regionFood.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/regionFood/show/$regionFood.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        regionFood.clearErrors()

        populateValidParams(params)
        params.id = regionFood.id
        params.version = -1
        controller.update()

        assert view == "/regionFood/edit"
        assert model.regionFoodInstance != null
        assert model.regionFoodInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/regionFood/list'

        response.reset()

        populateValidParams(params)
        def regionFood = new RegionFood(params)

        assert regionFood.save() != null
        assert RegionFood.count() == 1

        params.id = regionFood.id

        controller.delete()

        assert RegionFood.count() == 0
        assert RegionFood.get(regionFood.id) == null
        assert response.redirectedUrl == '/regionFood/list'
    }
}
