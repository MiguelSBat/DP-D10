<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<b><spring:message code="actor.name" /></b>
<jstl:out value="${user.name}" />
<br />
<b><spring:message code="actor.surname" /></b>
<jstl:out value="${user.surname}" />
<br />
<b><spring:message code="actor.email" /></b>
<jstl:out value="${user.emailAddress}" />
<br />
<b><spring:message code="actor.phone" /></b>
<jstl:out value="${user.phoneNumber}" />
<br />
<b><spring:message code="actor.address" /></b>
<jstl:out value="${user.postalAddress}" />
<br />

<!--  Listing grid -->

<display:table pagesize="5" class="displaytag" keepStatus="true" name="articles" requestURI="${requestURI}" id="row">

<!-- Attributes -->

<spring:message code="article.title" var="title"/>
<display:column title="${title}" sortable="false">
	<a href="article/display.do?articleId=${row.id}"><jstl:out value="${row.title}"/></a>
</display:column>

<spring:message code="article.summary" var="summary"/>
<display:column property="summary" title="${summary}" sortable="false"/>
 
<%-- <spring:message code="article.datePattern" var="datePattern"/> --%>
<spring:message code="article.publishMoment" var="moment"/>
<display:column property="publishMoment" title="${moment}" sortable="false" format="${datePattern}"/>

</display:table>