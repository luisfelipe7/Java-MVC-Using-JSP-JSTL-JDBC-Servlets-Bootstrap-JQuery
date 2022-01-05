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
	<c:set var="data" value="luv2code" />
	Length of the string
	<b>${data}</b>: ${fn:length(data)}

	<br>
	<br> Upper case version of the string
	<b>${data}</b>: ${fn:toUpperCase(data)}

	<br>
	<br> Does the String
	<b>${data}</b> start with
	<b>luv</b>?: ${fn:startsWith(data,"luv")}

</body>
</html>