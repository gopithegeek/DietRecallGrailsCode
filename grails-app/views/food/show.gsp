
<%@ page import="com.ardhika.health.Food" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'food.label', default: 'Food')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-food" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-food" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list food">
			
				<g:if test="${foodInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="food.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${foodInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${foodInstance?.foodGroup}">
				<li class="fieldcontain">
					<span id="foodGroup-label" class="property-label"><g:message code="food.foodGroup.label" default="Food Group" /></span>
					
						<span class="property-value" aria-labelledby="foodGroup-label"><g:link controller="foodGroup" action="show" id="${foodInstance?.foodGroup?.id}">${foodInstance?.foodGroup?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${foodInstance?.uom}">
				<li class="fieldcontain">
					<span id="uom-label" class="property-label"><g:message code="food.uom.label" default="Uom" /></span>
					
						<span class="property-value" aria-labelledby="uom-label"><g:link controller="unitOfMeasurement" action="show" id="${foodInstance?.uom?.id}">${foodInstance?.uom?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${foodInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="food.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${foodInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${foodInstance?.photo}">
				<li class="fieldcontain">
					<span id="photo-label" class="property-label"><g:message code="food.photo.label" default="Photo" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${foodInstance?.nutrition}">
				<li class="fieldcontain">
					<span id="nutrition-label" class="property-label"><g:message code="food.nutrition.label" default="Nutrition" /></span>
					
						<span class="property-value" aria-labelledby="nutrition-label"><g:link controller="nutrition" action="show" id="${foodInstance?.nutrition?.id}">${foodInstance?.nutrition?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${foodInstance?.activeStatus}">
				<li class="fieldcontain">
					<span id="activeStatus-label" class="property-label"><g:message code="food.activeStatus.label" default="Active Status" /></span>
					
						<span class="property-value" aria-labelledby="activeStatus-label"><g:fieldValue bean="${foodInstance}" field="activeStatus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${foodInstance?.catFoodCode}">
				<li class="fieldcontain">
					<span id="catFoodCode-label" class="property-label"><g:message code="food.catFoodCode.label" default="Cat Food Code" /></span>
					
						<span class="property-value" aria-labelledby="catFoodCode-label"><g:fieldValue bean="${foodInstance}" field="catFoodCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${foodInstance?.regionFood}">
				<li class="fieldcontain">
					<span id="regionFood-label" class="property-label"><g:message code="food.regionFood.label" default="Region Food" /></span>
					
						<g:each in="${foodInstance.regionFood}" var="r">
						<span class="property-value" aria-labelledby="regionFood-label"><g:link controller="regionFood" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${foodInstance?.id}" />
					<g:link class="edit" action="edit" id="${foodInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
