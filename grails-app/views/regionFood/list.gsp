
<%@ page import="com.ardhika.health.RegionFood" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'regionFood.label', default: 'RegionFood')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-regionFood" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-regionFood" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="foodName" title="${message(code: 'regionFood.foodName.label', default: 'Food Name')}" />
					
						<g:sortableColumn property="mealTime" title="${message(code: 'regionFood.mealTime.label', default: 'Meal Time')}" />
					
						<th><g:message code="regionFood.region.label" default="Region" /></th>
					
						<th><g:message code="regionFood.food.label" default="Food" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${regionFoodInstanceList}" status="i" var="regionFoodInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${regionFoodInstance.id}">${fieldValue(bean: regionFoodInstance, field: "foodName")}</g:link></td>
					
						<td><g:formatDate date="${regionFoodInstance.mealTime}" /></td>
					
						<td>${fieldValue(bean: regionFoodInstance, field: "region")}</td>
					
						<td>${fieldValue(bean: regionFoodInstance, field: "food")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${regionFoodInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
