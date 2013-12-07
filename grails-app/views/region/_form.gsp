<%@ page import="com.ardhika.health.Region" %>



<div class="fieldcontain ${hasErrors(bean: regionInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="region.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${regionInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regionInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="region.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" required="" value="${regionInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regionInstance, field: 'regionFood', 'error')} ">
	<label for="regionFood">
		<g:message code="region.regionFood.label" default="Region Food" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${regionInstance?.regionFood?}" var="r">
    <li><g:link controller="regionFood" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="regionFood" action="create" params="['region.id': regionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'regionFood.label', default: 'RegionFood')])}</g:link>
</li>
</ul>

</div>

