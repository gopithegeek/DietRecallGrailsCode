<%@ page import="com.ardhika.health.UnitOfMeasurement" %>



<div class="fieldcontain ${hasErrors(bean: unitOfMeasurementInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="unitOfMeasurement.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${unitOfMeasurementInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: unitOfMeasurementInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="unitOfMeasurement.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" required="" value="${unitOfMeasurementInstance?.code}"/>
</div>

