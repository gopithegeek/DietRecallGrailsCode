
<%@ page import="com.ardhika.health.Nutrition" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'nutrition.label', default: 'Nutrition')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-nutrition" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-nutrition" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list nutrition">
			
				<g:if test="${nutritionInstance?.help}">
				<li class="fieldcontain">
					<span id="help-label" class="property-label"><g:message code="nutrition.help.label" default="Help" /></span>
					
						<span class="property-value" aria-labelledby="help-label"><g:fieldValue bean="${nutritionInstance}" field="help"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.addDrink}">
				<li class="fieldcontain">
					<span id="addDrink-label" class="property-label"><g:message code="nutrition.addDrink.label" default="Add Drink" /></span>
					
						<span class="property-value" aria-labelledby="addDrink-label"><g:formatBoolean boolean="${nutritionInstance?.addDrink}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.calories}">
				<li class="fieldcontain">
					<span id="calories-label" class="property-label"><g:message code="nutrition.calories.label" default="Calories" /></span>
					
						<span class="property-value" aria-labelledby="calories-label"><g:fieldValue bean="${nutritionInstance}" field="calories"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.carbohydrate}">
				<li class="fieldcontain">
					<span id="carbohydrate-label" class="property-label"><g:message code="nutrition.carbohydrate.label" default="Carbohydrate" /></span>
					
						<span class="property-value" aria-labelledby="carbohydrate-label"><g:fieldValue bean="${nutritionInstance}" field="carbohydrate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.cerealExchange}">
				<li class="fieldcontain">
					<span id="cerealExchange-label" class="property-label"><g:message code="nutrition.cerealExchange.label" default="Cereal Exchange" /></span>
					
						<span class="property-value" aria-labelledby="cerealExchange-label"><g:fieldValue bean="${nutritionInstance}" field="cerealExchange"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.fat}">
				<li class="fieldcontain">
					<span id="fat-label" class="property-label"><g:message code="nutrition.fat.label" default="Fat" /></span>
					
						<span class="property-value" aria-labelledby="fat-label"><g:fieldValue bean="${nutritionInstance}" field="fat"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.fatExchange}">
				<li class="fieldcontain">
					<span id="fatExchange-label" class="property-label"><g:message code="nutrition.fatExchange.label" default="Fat Exchange" /></span>
					
						<span class="property-value" aria-labelledby="fatExchange-label"><g:fieldValue bean="${nutritionInstance}" field="fatExchange"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.fibre}">
				<li class="fieldcontain">
					<span id="fibre-label" class="property-label"><g:message code="nutrition.fibre.label" default="Fibre" /></span>
					
						<span class="property-value" aria-labelledby="fibre-label"><g:fieldValue bean="${nutritionInstance}" field="fibre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.fruitExchange}">
				<li class="fieldcontain">
					<span id="fruitExchange-label" class="property-label"><g:message code="nutrition.fruitExchange.label" default="Fruit Exchange" /></span>
					
						<span class="property-value" aria-labelledby="fruitExchange-label"><g:fieldValue bean="${nutritionInstance}" field="fruitExchange"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.isBedteaItem}">
				<li class="fieldcontain">
					<span id="isBedteaItem-label" class="property-label"><g:message code="nutrition.isBedteaItem.label" default="Is Bedtea Item" /></span>
					
						<span class="property-value" aria-labelledby="isBedteaItem-label"><g:formatBoolean boolean="${nutritionInstance?.isBedteaItem}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.isBedtimeSnackItem}">
				<li class="fieldcontain">
					<span id="isBedtimeSnackItem-label" class="property-label"><g:message code="nutrition.isBedtimeSnackItem.label" default="Is Bedtime Snack Item" /></span>
					
						<span class="property-value" aria-labelledby="isBedtimeSnackItem-label"><g:formatBoolean boolean="${nutritionInstance?.isBedtimeSnackItem}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.isBreakfastItem}">
				<li class="fieldcontain">
					<span id="isBreakfastItem-label" class="property-label"><g:message code="nutrition.isBreakfastItem.label" default="Is Breakfast Item" /></span>
					
						<span class="property-value" aria-labelledby="isBreakfastItem-label"><g:formatBoolean boolean="${nutritionInstance?.isBreakfastItem}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.isCarbohydrateRestricted}">
				<li class="fieldcontain">
					<span id="isCarbohydrateRestricted-label" class="property-label"><g:message code="nutrition.isCarbohydrateRestricted.label" default="Is Carbohydrate Restricted" /></span>
					
						<span class="property-value" aria-labelledby="isCarbohydrateRestricted-label"><g:formatBoolean boolean="${nutritionInstance?.isCarbohydrateRestricted}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.isDinnerItem}">
				<li class="fieldcontain">
					<span id="isDinnerItem-label" class="property-label"><g:message code="nutrition.isDinnerItem.label" default="Is Dinner Item" /></span>
					
						<span class="property-value" aria-labelledby="isDinnerItem-label"><g:formatBoolean boolean="${nutritionInstance?.isDinnerItem}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.isDrinkRequired}">
				<li class="fieldcontain">
					<span id="isDrinkRequired-label" class="property-label"><g:message code="nutrition.isDrinkRequired.label" default="Is Drink Required" /></span>
					
						<span class="property-value" aria-labelledby="isDrinkRequired-label"><g:formatBoolean boolean="${nutritionInstance?.isDrinkRequired}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.isEveningteaItem}">
				<li class="fieldcontain">
					<span id="isEveningteaItem-label" class="property-label"><g:message code="nutrition.isEveningteaItem.label" default="Is Eveningtea Item" /></span>
					
						<span class="property-value" aria-labelledby="isEveningteaItem-label"><g:formatBoolean boolean="${nutritionInstance?.isEveningteaItem}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.isLunchItem}">
				<li class="fieldcontain">
					<span id="isLunchItem-label" class="property-label"><g:message code="nutrition.isLunchItem.label" default="Is Lunch Item" /></span>
					
						<span class="property-value" aria-labelledby="isLunchItem-label"><g:formatBoolean boolean="${nutritionInstance?.isLunchItem}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.isMidmornSnackItem}">
				<li class="fieldcontain">
					<span id="isMidmornSnackItem-label" class="property-label"><g:message code="nutrition.isMidmornSnackItem.label" default="Is Midmorn Snack Item" /></span>
					
						<span class="property-value" aria-labelledby="isMidmornSnackItem-label"><g:formatBoolean boolean="${nutritionInstance?.isMidmornSnackItem}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.isMilkRequired}">
				<li class="fieldcontain">
					<span id="isMilkRequired-label" class="property-label"><g:message code="nutrition.isMilkRequired.label" default="Is Milk Required" /></span>
					
						<span class="property-value" aria-labelledby="isMilkRequired-label"><g:formatBoolean boolean="${nutritionInstance?.isMilkRequired}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.isOilRequired}">
				<li class="fieldcontain">
					<span id="isOilRequired-label" class="property-label"><g:message code="nutrition.isOilRequired.label" default="Is Oil Required" /></span>
					
						<span class="property-value" aria-labelledby="isOilRequired-label"><g:formatBoolean boolean="${nutritionInstance?.isOilRequired}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.isPartOfDelhiDB}">
				<li class="fieldcontain">
					<span id="isPartOfDelhiDB-label" class="property-label"><g:message code="nutrition.isPartOfDelhiDB.label" default="Is Part Of Delhi DB" /></span>
					
						<span class="property-value" aria-labelledby="isPartOfDelhiDB-label"><g:formatBoolean boolean="${nutritionInstance?.isPartOfDelhiDB}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.isPartOfKeralaDB}">
				<li class="fieldcontain">
					<span id="isPartOfKeralaDB-label" class="property-label"><g:message code="nutrition.isPartOfKeralaDB.label" default="Is Part Of Kerala DB" /></span>
					
						<span class="property-value" aria-labelledby="isPartOfKeralaDB-label"><g:formatBoolean boolean="${nutritionInstance?.isPartOfKeralaDB}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.isPartOfLineItem}">
				<li class="fieldcontain">
					<span id="isPartOfLineItem-label" class="property-label"><g:message code="nutrition.isPartOfLineItem.label" default="Is Part Of Line Item" /></span>
					
						<span class="property-value" aria-labelledby="isPartOfLineItem-label"><g:formatBoolean boolean="${nutritionInstance?.isPartOfLineItem}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.isSnackseveItem}">
				<li class="fieldcontain">
					<span id="isSnackseveItem-label" class="property-label"><g:message code="nutrition.isSnackseveItem.label" default="Is Snackseve Item" /></span>
					
						<span class="property-value" aria-labelledby="isSnackseveItem-label"><g:formatBoolean boolean="${nutritionInstance?.isSnackseveItem}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.isSodiumRestricted}">
				<li class="fieldcontain">
					<span id="isSodiumRestricted-label" class="property-label"><g:message code="nutrition.isSodiumRestricted.label" default="Is Sodium Restricted" /></span>
					
						<span class="property-value" aria-labelledby="isSodiumRestricted-label"><g:formatBoolean boolean="${nutritionInstance?.isSodiumRestricted}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.isSugarRequired}">
				<li class="fieldcontain">
					<span id="isSugarRequired-label" class="property-label"><g:message code="nutrition.isSugarRequired.label" default="Is Sugar Required" /></span>
					
						<span class="property-value" aria-labelledby="isSugarRequired-label"><g:formatBoolean boolean="${nutritionInstance?.isSugarRequired}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.measure}">
				<li class="fieldcontain">
					<span id="measure-label" class="property-label"><g:message code="nutrition.measure.label" default="Measure" /></span>
					
						<span class="property-value" aria-labelledby="measure-label"><g:fieldValue bean="${nutritionInstance}" field="measure"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.measureSize}">
				<li class="fieldcontain">
					<span id="measureSize-label" class="property-label"><g:message code="nutrition.measureSize.label" default="Measure Size" /></span>
					
						<span class="property-value" aria-labelledby="measureSize-label"><g:fieldValue bean="${nutritionInstance}" field="measureSize"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.meatExchange}">
				<li class="fieldcontain">
					<span id="meatExchange-label" class="property-label"><g:message code="nutrition.meatExchange.label" default="Meat Exchange" /></span>
					
						<span class="property-value" aria-labelledby="meatExchange-label"><g:fieldValue bean="${nutritionInstance}" field="meatExchange"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.milkExchange}">
				<li class="fieldcontain">
					<span id="milkExchange-label" class="property-label"><g:message code="nutrition.milkExchange.label" default="Milk Exchange" /></span>
					
						<span class="property-value" aria-labelledby="milkExchange-label"><g:fieldValue bean="${nutritionInstance}" field="milkExchange"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.monoUnsaturatedFat}">
				<li class="fieldcontain">
					<span id="monoUnsaturatedFat-label" class="property-label"><g:message code="nutrition.monoUnsaturatedFat.label" default="Mono Unsaturated Fat" /></span>
					
						<span class="property-value" aria-labelledby="monoUnsaturatedFat-label"><g:fieldValue bean="${nutritionInstance}" field="monoUnsaturatedFat"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.potassiumContent}">
				<li class="fieldcontain">
					<span id="potassiumContent-label" class="property-label"><g:message code="nutrition.potassiumContent.label" default="Potassium Content" /></span>
					
						<span class="property-value" aria-labelledby="potassiumContent-label"><g:fieldValue bean="${nutritionInstance}" field="potassiumContent"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.protein}">
				<li class="fieldcontain">
					<span id="protein-label" class="property-label"><g:message code="nutrition.protein.label" default="Protein" /></span>
					
						<span class="property-value" aria-labelledby="protein-label"><g:fieldValue bean="${nutritionInstance}" field="protein"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.pulseExchange}">
				<li class="fieldcontain">
					<span id="pulseExchange-label" class="property-label"><g:message code="nutrition.pulseExchange.label" default="Pulse Exchange" /></span>
					
						<span class="property-value" aria-labelledby="pulseExchange-label"><g:fieldValue bean="${nutritionInstance}" field="pulseExchange"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.saturatedFat}">
				<li class="fieldcontain">
					<span id="saturatedFat-label" class="property-label"><g:message code="nutrition.saturatedFat.label" default="Saturated Fat" /></span>
					
						<span class="property-value" aria-labelledby="saturatedFat-label"><g:fieldValue bean="${nutritionInstance}" field="saturatedFat"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.sodiumContent}">
				<li class="fieldcontain">
					<span id="sodiumContent-label" class="property-label"><g:message code="nutrition.sodiumContent.label" default="Sodium Content" /></span>
					
						<span class="property-value" aria-labelledby="sodiumContent-label"><g:fieldValue bean="${nutritionInstance}" field="sodiumContent"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.unsaturatedFat}">
				<li class="fieldcontain">
					<span id="unsaturatedFat-label" class="property-label"><g:message code="nutrition.unsaturatedFat.label" default="Unsaturated Fat" /></span>
					
						<span class="property-value" aria-labelledby="unsaturatedFat-label"><g:fieldValue bean="${nutritionInstance}" field="unsaturatedFat"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.vegetableExchange}">
				<li class="fieldcontain">
					<span id="vegetableExchange-label" class="property-label"><g:message code="nutrition.vegetableExchange.label" default="Vegetable Exchange" /></span>
					
						<span class="property-value" aria-labelledby="vegetableExchange-label"><g:fieldValue bean="${nutritionInstance}" field="vegetableExchange"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${nutritionInstance?.weight}">
				<li class="fieldcontain">
					<span id="weight-label" class="property-label"><g:message code="nutrition.weight.label" default="Weight" /></span>
					
						<span class="property-value" aria-labelledby="weight-label"><g:fieldValue bean="${nutritionInstance}" field="weight"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${nutritionInstance?.id}" />
					<g:link class="edit" action="edit" id="${nutritionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
