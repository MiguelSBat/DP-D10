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
<%@taglib prefix="acme" tagdir="/WEB-INF/tags" %>


	<%-- <form:hidden path="id" />
	<form:hidden path="version" /> 
	<form:hidden path="replies" />
	--%>
	<form:form action="newspaper/edit.do" modelAttribute="newspaper">
	<form:hidden path="newspaper" />
	<form:hidden path="user" />  
	<form:hidden path="moment" />  
	
	<acme:textarea code="newspaper.title" path="text"/>
	
	<acme:textbox code="newspaper.description" path="description"/>

	<spring:message code="newspaper.publicationDate" var="publicationDate"/>
	<form:label path="publicationDate">${moment}</form:label>
	<form:input path="publicationDate" placeholder="dd/mm/yyyy HH:MM"/>
	<form:errors cssClass="error" path="publicationDate"/>
	<br />
	
	<acme:textbox code="newspaper.picture" path="picture"/>
	
	<acme:submit name="save" code="newspaper.save"/>

	<%-- <security:authorize access="hasRole('ADMINISTRATOR')">
	<acme:submit name="delete" code="comment.delete"/>
	</security:authorize> --%>
	
	<acme:cancel url="" code="newspaper.cancel"/>
	
	</form:form>
	
