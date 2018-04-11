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

<spring:message code="master.page.date.format" var="dateFormat" />	
<fmt:setLocale value="${locale}"/>
	
<div id="article">

	<br />
	
	<b><spring:message code="article.title"/>:</b>
	<jstl:out value="${article.title}" />
	<br />
	
	<b><spring:message code="article.publishMoment"/>:</b> 
	<fmt:formatDate value="${article.publishMoment}" pattern="${dateFormat}" />
	<br />
	<br />
	
	<b><spring:message code="article.summary"/>:</b>
	<jstl:out value="${article.summary}" />
	<br />
	<br />
	
	<b><spring:message code="article.text"/>:</b>
	<jstl:out value="${article.text}" />
	<br />
	
	
	<jstl:forEach items="${article.pictures}" var="current">
		<img style="max-width: 20vw;" src="${current}" alt="${current}" />
		<br />
	</jstl:forEach>
	<br />
	<a href="newspaper/display.do?newspaperId=${newspaperId}"><spring:message code="article.backToNewspaper"/></a>
</div>





	
