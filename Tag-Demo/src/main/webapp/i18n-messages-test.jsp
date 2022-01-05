

<!DOCTYPE html>
<html lang="en">
<!-- This is the head of my HTML File -->

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie-edge" />
<!-- Importing the tag library -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Importing the functions -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- Loading the Language -->
<c:set var="theLocale" value="${not empty param.theLocale ? param.theLocale : pageContext.request.locale}" scope="session" />
<!-- Setting the language -->
<fmt:setLocale value="${theLocale}" />
<fmt:setBundle basename="com.luv2code.jsp.tagdemo.i18n.resources.myLabels" />
<!-- Setting the sample data -->
<%
// Just Create some sample data (usually provided by MVC)
%>

<title>JSTL TAGS</title>
</head>


<!-- This is the body of my HTML File -->
<body>

	<a href="i18n-messages-test.jsp?theLocale=en_US">English (US)</a> |
	<a href="i18n-messages-test.jsp?theLocale=es_ES">Spanish (ES)</a> |
	<a href="i18n-messages-test.jsp?theLocale=de_DE">German (DE)</a>

	<hr>
	<fmt:message key="label.greeting" />
	<br>
	<fmt:message key="label.firstName" />
	Felipe
	<br>
	<fmt:message key="label.lastName" />
	Castro
	<br>
	<fmt:message key="label.welcome" />
	<br>
	
	<hr>
	Select Locale: ${theLocale}


</body>
</html>