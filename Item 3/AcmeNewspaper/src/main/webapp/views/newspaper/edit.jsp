<%--
 * edit.jsp
 *
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<!-- 
<form:form action="newspaper/edit.do" modelAttribute="newspaper">

	<form:hidden path="id" />
	<form:hidden path="version" />

	<form:label path="title">
		<spring:message code="stage.title" />:
	</form:label><br/>
	<form:input path="title" />
	<form:errors cssClass="error" path="title" />
	<br/>
	<br/>
	
	<form:label path="description">
		<spring:message code="newspaper.description" />:
	</form:label><br/>
	<form:textarea path="description" />
	<form:errors cssClass="error" path="description" />
	<br/>
	<br/>
	
	<form:label path="picture">
		<spring:message code="newspaper.picture" />:
	</form:label><br/>
	<form:textarea path="picture" />
	<form:errors cssClass="error" path="picture" />
	<br/>
	<br/>
	
	<!-- Guardamos en una variable el formato de la fecha seg�n el idioma -->
	<spring:message code="master.page.date.format" var="dateFormat" />
	
	 <form:label path="publicationDate">
		<spring:message code="newspaper.publicationDate" />:
	</form:label><br/>
	<form:input path="publicationDate" placeholder="${dateFormat}" />
	<form:errors cssClass="error" path="publicationDate" /><br /><br />
	<br/>
	<br/> 
	


	<input type="submit" name="save"
		value="<spring:message code="newspaper.save" />" />&nbsp; 
	
	<jstl:if test="${newspaper.id != 0}">
	<input type="submit" name="delete"
		value="<spring:message code="newspaper.delete" />"/>
	</jstl:if>
		
	<input type="button" name="cancel"
		value="<spring:message code="newspaper.cancel" />"
		onclick="javascript: relativeRedir('newspaper/admin/list.do');" />
	<br />

</form:form>
--->