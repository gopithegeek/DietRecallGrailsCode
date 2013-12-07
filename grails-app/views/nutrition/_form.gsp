<%@ page import="com.ardhika.health.Nutrition" %>


<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'weight', 'error')} required">
	<label for="weight">
		<g:message code="nutrition.weight.label" default="Weight" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="weight" type="number" value="${nutritionInstance.weight}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'measure', 'error')} required">
	<label for="measure">
		<g:message code="nutrition.measure.label" default="Measure" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="measure" value="${fieldValue(bean: nutritionInstance, field: 'measure')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'measureSize', 'error')} required">
	<label for="measureSize">
		<g:message code="nutrition.measureSize.label" default="Measure Size" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="measureSize" type="number" value="${nutritionInstance.measureSize}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'calories', 'error')} required">
	<label for="calories">
		<g:message code="nutrition.calories.label" default="Calories" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="calories" type="number" value="${nutritionInstance.calories}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'protein', 'error')} required">
	<label for="protein">
		<g:message code="nutrition.protein.label" default="Protein" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="protein" value="${fieldValue(bean: nutritionInstance, field: 'protein')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'carbohydrate', 'error')} required">
	<label for="carbohydrate">
		<g:message code="nutrition.carbohydrate.label" default="Carbohydrate" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="carbohydrate" value="${fieldValue(bean: nutritionInstance, field: 'carbohydrate')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'isCarbohydrateRestricted', 'error')} ">
	<label for="isCarbohydrateRestricted">
		<g:message code="nutrition.isCarbohydrateRestricted.label" default="Is Carbohydrate Restricted" />
		
	</label>
	<g:checkBox name="isCarbohydrateRestricted" value="${nutritionInstance?.isCarbohydrateRestricted}" />
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'fat', 'error')} required">
	<label for="fat">
		<g:message code="nutrition.fat.label" default="Fat" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="fat" value="${fieldValue(bean: nutritionInstance, field: 'fat')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'saturatedFat', 'error')} required">
	<label for="saturatedFat">
		<g:message code="nutrition.saturatedFat.label" default="Saturated Fat" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="saturatedFat" value="${fieldValue(bean: nutritionInstance, field: 'saturatedFat')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'unsaturatedFat', 'error')} required">
	<label for="unsaturatedFat">
		<g:message code="nutrition.unsaturatedFat.label" default="Unsaturated Fat" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="unsaturatedFat" value="${fieldValue(bean: nutritionInstance, field: 'unsaturatedFat')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'fibre', 'error')} required">
	<label for="fibre">
		<g:message code="nutrition.fibre.label" default="Fibre" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="fibre" value="${fieldValue(bean: nutritionInstance, field: 'fibre')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'monoUnsaturatedFat', 'error')} required">
	<label for="monoUnsaturatedFat">
		<g:message code="nutrition.monoUnsaturatedFat.label" default="Mono Unsaturated Fat" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="monoUnsaturatedFat" value="${fieldValue(bean: nutritionInstance, field: 'monoUnsaturatedFat')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'sodiumContent', 'error')} required">
	<label for="sodiumContent">
		<g:message code="nutrition.sodiumContent.label" default="Sodium Content" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="sodiumContent" value="${fieldValue(bean: nutritionInstance, field: 'sodiumContent')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'isSodiumRestricted', 'error')} ">
	<label for="isSodiumRestricted">
		<g:message code="nutrition.isSodiumRestricted.label" default="Is Sodium Restricted" />
		
	</label>
	<g:checkBox name="isSodiumRestricted" value="${nutritionInstance?.isSodiumRestricted}" />
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'potassiumContent', 'error')} required">
	<label for="potassiumContent">
		<g:message code="nutrition.potassiumContent.label" default="Potassium Content" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="potassiumContent" value="${fieldValue(bean: nutritionInstance, field: 'potassiumContent')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'isBedteaItem', 'error')} ">
	<label for="isBedteaItem">
		<g:message code="nutrition.isBedteaItem.label" default="Is Bedtea Item" />
		
	</label>
	<g:checkBox name="isBedteaItem" value="${nutritionInstance?.isBedteaItem}" />
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'isBreakfastItem', 'error')} ">
	<label for="isBreakfastItem">
		<g:message code="nutrition.isBreakfastItem.label" default="Is Breakfast Item" />
		
	</label>
	<g:checkBox name="isBreakfastItem" value="${nutritionInstance?.isBreakfastItem}" />
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'isMidmornSnackItem', 'error')} ">
	<label for="isMidmornSnackItem">
		<g:message code="nutrition.isMidmornSnackItem.label" default="Is Midmorn Snack Item" />
		
	</label>
	<g:checkBox name="isMidmornSnackItem" value="${nutritionInstance?.isMidmornSnackItem}" />
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'isLunchItem', 'error')} ">
	<label for="isLunchItem">
		<g:message code="nutrition.isLunchItem.label" default="Is Lunch Item" />
		
	</label>
	<g:checkBox name="isLunchItem" value="${nutritionInstance?.isLunchItem}" />
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'isEveningteaItem', 'error')} ">
	<label for="isEveningteaItem">
		<g:message code="nutrition.isEveningteaItem.label" default="Is Eveningtea Item" />
		
	</label>
	<g:checkBox name="isEveningteaItem" value="${nutritionInstance?.isEveningteaItem}" />
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'isSnackseveItem', 'error')} ">
	<label for="isSnackseveItem">
		<g:message code="nutrition.isSnackseveItem.label" default="Is Snackseve Item" />
		
	</label>
	<g:checkBox name="isSnackseveItem" value="${nutritionInstance?.isSnackseveItem}" />
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'isDinnerItem', 'error')} ">
	<label for="isDinnerItem">
		<g:message code="nutrition.isDinnerItem.label" default="Is Dinner Item" />
		
	</label>
	<g:checkBox name="isDinnerItem" value="${nutritionInstance?.isDinnerItem}" />
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'isBedtimeSnackItem', 'error')} ">
	<label for="isBedtimeSnackItem">
		<g:message code="nutrition.isBedtimeSnackItem.label" default="Is Bedtime Snack Item" />
		
	</label>
	<g:checkBox name="isBedtimeSnackItem" value="${nutritionInstance?.isBedtimeSnackItem}" />
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'cerealExchange', 'error')} required">
	<label for="cerealExchange">
		<g:message code="nutrition.cerealExchange.label" default="Cereal Exchange" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cerealExchange" type="number" value="${nutritionInstance.cerealExchange}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'pulseExchange', 'error')} required">
	<label for="pulseExchange">
		<g:message code="nutrition.pulseExchange.label" default="Pulse Exchange" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="pulseExchange" type="number" value="${nutritionInstance.pulseExchange}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'milkExchange', 'error')} required">
	<label for="milkExchange">
		<g:message code="nutrition.milkExchange.label" default="Milk Exchange" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="milkExchange" type="number" value="${nutritionInstance.milkExchange}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'vegetableExchange', 'error')} required">
	<label for="vegetableExchange">
		<g:message code="nutrition.vegetableExchange.label" default="Vegetable Exchange" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="vegetableExchange" type="number" value="${nutritionInstance.vegetableExchange}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'fruitExchange', 'error')} required">
	<label for="fruitExchange">
		<g:message code="nutrition.fruitExchange.label" default="Fruit Exchange" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="fruitExchange" type="number" value="${nutritionInstance.fruitExchange}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'fatExchange', 'error')} required">
	<label for="fatExchange">
		<g:message code="nutrition.fatExchange.label" default="Fat Exchange" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="fatExchange" type="number" value="${nutritionInstance.fatExchange}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'meatExchange', 'error')} required">
	<label for="meatExchange">
		<g:message code="nutrition.meatExchange.label" default="Meat Exchange" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="meatExchange" type="number" value="${nutritionInstance.meatExchange}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'isMilkRequired', 'error')} ">
	<label for="isMilkRequired">
		<g:message code="nutrition.isMilkRequired.label" default="Is Milk Required" />
		
	</label>
	<g:checkBox name="isMilkRequired" value="${nutritionInstance?.isMilkRequired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'isSugarRequired', 'error')} ">
	<label for="isSugarRequired">
		<g:message code="nutrition.isSugarRequired.label" default="Is Sugar Required" />
		
	</label>
	<g:checkBox name="isSugarRequired" value="${nutritionInstance?.isSugarRequired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'isOilRequired', 'error')} ">
	<label for="isOilRequired">
		<g:message code="nutrition.isOilRequired.label" default="Is Oil Required" />
		
	</label>
	<g:checkBox name="isOilRequired" value="${nutritionInstance?.isOilRequired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'isDrinkRequired', 'error')} ">
	<label for="isDrinkRequired">
		<g:message code="nutrition.isDrinkRequired.label" default="Is Drink Required" />
		
	</label>
	<g:checkBox name="isDrinkRequired" value="${nutritionInstance?.isDrinkRequired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'addDrink', 'error')} ">
	<label for="addDrink">
		<g:message code="nutrition.addDrink.label" default="Add Drink" />
		
	</label>
	<g:checkBox name="addDrink" value="${nutritionInstance?.addDrink}" />
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'isPartOfDelhiDB', 'error')} ">
	<label for="isPartOfDelhiDB">
		<g:message code="nutrition.isPartOfDelhiDB.label" default="Is Part Of Delhi DB" />
		
	</label>
	<g:checkBox name="isPartOfDelhiDB" value="${nutritionInstance?.isPartOfDelhiDB}" />
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'isPartOfKeralaDB', 'error')} ">
	<label for="isPartOfKeralaDB">
		<g:message code="nutrition.isPartOfKeralaDB.label" default="Is Part Of Kerala DB" />
		
	</label>
	<g:checkBox name="isPartOfKeralaDB" value="${nutritionInstance?.isPartOfKeralaDB}" />
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'isPartOfLineItem', 'error')} ">
	<label for="isPartOfLineItem">
		<g:message code="nutrition.isPartOfLineItem.label" default="Is Part Of Line Item" />
		
	</label>
	<g:checkBox name="isPartOfLineItem" value="${nutritionInstance?.isPartOfLineItem}" />
</div>

<div class="fieldcontain ${hasErrors(bean: nutritionInstance, field: 'help', 'error')} ">
	<label for="help">
		<g:message code="nutrition.help.label" default="Help" />
		
	</label>
	<g:textField name="help" value="${nutritionInstance?.help}"/>
</div>
