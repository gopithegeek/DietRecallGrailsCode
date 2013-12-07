<%@ page import="com.ardhika.health.Food" %>



<div class="fieldcontain ${hasErrors(bean: foodInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="food.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${foodInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: foodInstance, field: 'foodGroup', 'error')} required">
	<label for="foodGroup">
		<g:message code="food.foodGroup.label" default="Food Group" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="foodGroup" name="foodGroup.id" from="${com.ardhika.health.FoodGroup.list()}" optionKey="id" required="" value="${foodInstance?.foodGroup?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: foodInstance, field: 'uom', 'error')} required">
	<label for="uom">
		<g:message code="food.uom.label" default="Uom" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="uom" name="uom.id" from="${com.ardhika.health.UnitOfMeasurement.list()}" optionKey="id" required="" value="${foodInstance?.uom?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: foodInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="food.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${foodInstance.constraints.type.inList}" required="" value="${fieldValue(bean: foodInstance, field: 'type')}" valueMessagePrefix="food.type"/>
</div>

<div class="fieldcontain ${hasErrors(bean: foodInstance, field: 'photo', 'error')} ">
	<label for="photo">
		<g:message code="food.photo.label" default="Photo" />
		
	</label>
	<input type="file" id="photo" name="photo" />
</div>

<div class="fieldcontain ${hasErrors(bean: foodInstance, field: 'nutrition', 'error')} required">
	<label for="nutrition">
		<g:message code="food.nutrition.label" default="Nutrition" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="nutrition" name="nutrition.id" from="${com.ardhika.health.Nutrition.list()}" optionKey="id" required="" value="${foodInstance?.nutrition?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: foodInstance, field: 'activeStatus', 'error')} ">
	<label for="activeStatus">
		<g:message code="food.activeStatus.label" default="Active Status" />
		
	</label>
	<g:select name="activeStatus" from="${foodInstance.constraints.activeStatus.inList}" value="${foodInstance?.activeStatus}" valueMessagePrefix="food.activeStatus" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: foodInstance, field: 'catFoodCode', 'error')} ">
	<label for="catFoodCode">
		<g:message code="food.catFoodCode.label" default="Cat Food Code" />
		
	</label>
	<g:textField name="catFoodCode" value="${foodInstance?.catFoodCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: foodInstance, field: 'regionFood', 'error')} ">
	<label for="regionFood">
		<g:message code="food.regionFood.label" default="Region Food" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${foodInstance?.regionFood?}" var="r">
    <li><g:link controller="regionFood" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="regionFood" action="create" params="['food.id': foodInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'regionFood.label', default: 'RegionFood')])}</g:link>
</li>
</ul>

</div>

