
<%@ page import="com.ardhika.health.RegionFood" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'regionFood.label', default: 'RegionFood')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-regionFood" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-regionFood" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list regionFood">
			
				<g:if test="${regionFoodInstance?.foodName}">
				<li class="fieldcontain">
					<span id="foodName-label" class="property-label"><g:message code="regionFood.foodName.label" default="Food Name" /></span>
					
						<span class="property-value" aria-labelledby="foodName-label"><g:fieldValue bean="${regionFoodInstance}" field="foodName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${regionFoodInstance?.mealTime}">
				<li class="fieldcontain">
					<span id="mealTime-label" class="property-label"><g:message code="regionFood.mealTime.label" default="Meal Time" /></span>
					
						<span class="property-value" aria-labelledby="mealTime-label"><g:formatDate date="${regionFoodInstance?.mealTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${regionFoodInstance?.region}">
				<li class="fieldcontain">
					<span id="region-label" class="property-label"><g:message code="regionFood.region.label" default="Region" /></span>
					
						<span class="property-value" aria-labelledby="region-label"><g:link controller="region" action="show" id="${regionFoodInstance?.region?.id}">${regionFoodInstance?.region?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${regionFoodInstance?.food}">
				<li class="fieldcontain">
					<span id="food-label" class="property-label"><g:message code="regionFood.food.label" default="Food" /></span>
					
						<span class="property-value" aria-labelledby="food-label"><g:link controller="food" action="show" id="${regionFoodInstance?.food?.id}">${regionFoodInstance?.food?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${regionFoodInstance?.id}" />
					<g:link class="edit" action="edit" id="${regionFoodInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
