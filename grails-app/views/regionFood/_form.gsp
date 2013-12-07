<%@ page import="com.ardhika.health.RegionFood" %>



<div class="fieldcontain ${hasErrors(bean: regionFoodInstance, field: 'foodName', 'error')} required">
	<label for="foodName">
		<g:message code="regionFood.foodName.label" default="Food Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="foodName" required="" value="${regionFoodInstance?.foodName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regionFoodInstance, field: 'mealTime', 'error')} required">
	<label for="mealTime">
		<g:message code="regionFood.mealTime.label" default="Meal Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="mealTime" precision="day"  value="${regionFoodInstance?.mealTime}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: regionFoodInstance, field: 'region', 'error')} required">
	<label for="region">
		<g:message code="regionFood.region.label" default="Region" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="region" name="region.id" from="${com.ardhika.health.Region.list()}" optionKey="id" required="" value="${regionFoodInstance?.region?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regionFoodInstance, field: 'food', 'error')} required">
	<label for="food">
		<g:message code="regionFood.food.label" default="Food" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="food" name="food.id" from="${com.ardhika.health.Food.list()}" optionKey="id" required="" value="${regionFoodInstance?.food?.id}" class="many-to-one"/>
</div>

