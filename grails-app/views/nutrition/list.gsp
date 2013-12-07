
<%@ page import="com.ardhika.health.Nutrition" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'nutrition.label', default: 'Nutrition')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-nutrition" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-nutrition" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="help" title="${message(code: 'nutrition.help.label', default: 'Help')}" />
					
						<g:sortableColumn property="addDrink" title="${message(code: 'nutrition.addDrink.label', default: 'Add Drink')}" />
					
						<g:sortableColumn property="calories" title="${message(code: 'nutrition.calories.label', default: 'Calories')}" />
					
						<g:sortableColumn property="carbohydrate" title="${message(code: 'nutrition.carbohydrate.label', default: 'Carbohydrate')}" />
					
						<g:sortableColumn property="cerealExchange" title="${message(code: 'nutrition.cerealExchange.label', default: 'Cereal Exchange')}" />
					
						<g:sortableColumn property="fat" title="${message(code: 'nutrition.fat.label', default: 'Fat')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${nutritionInstanceList}" status="i" var="nutritionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${nutritionInstance.id}">${fieldValue(bean: nutritionInstance, field: "help")}</g:link></td>
					
						<td><g:formatBoolean boolean="${nutritionInstance.addDrink}" /></td>
					
						<td>${fieldValue(bean: nutritionInstance, field: "calories")}</td>
					
						<td>${fieldValue(bean: nutritionInstance, field: "carbohydrate")}</td>
					
						<td>${fieldValue(bean: nutritionInstance, field: "cerealExchange")}</td>
					
						<td>${fieldValue(bean: nutritionInstance, field: "fat")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${nutritionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
