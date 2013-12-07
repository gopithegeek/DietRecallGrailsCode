<%@ page import="com.ardhika.health.FoodGroup" %>



<div class="fieldcontain ${hasErrors(bean: foodGroupInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="foodGroup.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${foodGroupInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: foodGroupInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="foodGroup.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" required="" value="${foodGroupInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: foodGroupInstance, field: 'foodList', 'error')} ">
	<label for="foodList">
		<g:message code="foodGroup.foodList.label" default="Food List" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${foodGroupInstance?.foodList?}" var="f">
    <li><g:link controller="food" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="food" action="create" params="['foodGroup.id': foodGroupInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'food.label', default: 'Food')])}</g:link>
</li>
</ul>

</div>

