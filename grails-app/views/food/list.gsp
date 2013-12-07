
<%@ page import="com.ardhika.health.Food" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'food.label', default: 'Food')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-food" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-food" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'food.name.label', default: 'Name')}" />
					
						<th><g:message code="food.foodGroup.label" default="Food Group" /></th>
					
						<th><g:message code="food.uom.label" default="Uom" /></th>
					
						<g:sortableColumn property="type" title="${message(code: 'food.type.label', default: 'Type')}" />
					
						<g:sortableColumn property="photo" title="${message(code: 'food.photo.label', default: 'Photo')}" />
					
						<th><g:message code="food.nutrition.label" default="Nutrition" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${foodInstanceList}" status="i" var="foodInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${foodInstance.id}">${fieldValue(bean: foodInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: foodInstance, field: "foodGroup")}</td>
					
						<td>${fieldValue(bean: foodInstance, field: "uom")}</td>
					
						<td>${fieldValue(bean: foodInstance, field: "type")}</td>
					
						<td><img src="<g:createLink action='showImage' params='[id:foodInstance.id]'/>" 
							height="50px" width="50px"/></td>
					
						<td>${fieldValue(bean: foodInstance, field: "nutrition")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${foodInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
