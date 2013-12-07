<%@ page import="com.ardhika.health.MealTime" %>



<div class="fieldcontain ${hasErrors(bean: mealTimeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="mealTime.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${mealTimeInstance?.name}"/>
</div>

