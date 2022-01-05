<!DOCTYPE html>

<html lang="en">
<!-- This is the head of my HTML File -->

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie-edge" />
<!-- Importing the tag library -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Importing the tag library for functions -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- Setting the sample data -->
<%
// Just Create some sample data (usually provided by MVC)
%>

<title>JSTL TAGS</title>
</head>


<!-- This is the body of my HTML File -->
<body>
	<h1>Implementing JSTL Tags Functions</h1>
	<hr>
	<!-- Setting the data -->
	<c:set var="data" value="Singapore,Tokio,Mumbai,London" />
	<!-- Using the functions -->
	<h3>Split Demo</h3>
	<p> Splitting these data: ${data} </p>
	<c:set var="citiesArray" value="${fn:split(data,',')}" />
	<p> The data split is: </p>
	<ul>
	<c:forEach var="city" items="${citiesArray}">
		<li>${city}</li>
	</c:forEach>
	</ul>
	<br>
	<h3> Join Demo </h3>
	<p> Joining the previous data using an *: </p>
	<c:set var="fun" value="${fn:join(citiesArray,'*')}" />
	${fun}
</body>
</html>