<!DOCTYPE html>

<html lang="en">
<!-- This is the head of my HTML File -->

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie-edge" />
<!-- Importing the tag library -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Setting the sample data -->
<%
// Just Create some sample data (usually provided by MVC)
String[] provinces = { "Heredia", "San José", "Alajuela" };
pageContext.setAttribute("myProvinces", provinces);
%>

<title>JSTL TAGS</title>
</head>


<!-- This is the body of my HTML File -->
<body>
	<h1>Implementing JSTL For Each</h1>
	<hr>
	<!--  Using the JSTL TAGS -->
	<h3>Here are some provinces of Costa Rica:</h3>
	<ul>
		<c:forEach var="province" items="${myProvinces}">
			<li>${province}</li>
		</c:forEach>
	</ul>
</body>
</html>