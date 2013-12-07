
<%@ page import="com.ardhika.health.FoodGroup" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'foodGroup.label', default: 'FoodGroup')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-foodGroup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-foodGroup" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list foodGroup">
			
				<g:if test="${foodGroupInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="foodGroup.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${foodGroupInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${foodGroupInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="foodGroup.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${foodGroupInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${foodGroupInstance?.foodList}">
				<li class="fieldcontain">
					<span id="foodList-label" class="property-label"><g:message code="foodGroup.foodList.label" default="Food List" /></span>
					
						<g:each in="${foodGroupInstance.foodList}" var="f">
						<span class="property-value" aria-labelledby="foodList-label"><g:link controller="food" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${foodGroupInstance?.id}" />
					<g:link class="edit" action="edit" id="${foodGroupInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
