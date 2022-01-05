<!DOCTYPE html>

<html lang="en">
<!-- This is the head of my HTML File -->

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie-edge" />
<!-- Importing the tag library -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<title>JSTL TAGS</title>
</head>


<!-- This is the body of my HTML File -->
<body>
	<h1>Learning about JSTL TAGS</h1>
	<!--  Using the JSTL TAGS -->
	<c:set var="stuff" value="<%= new java.util.Date()  %>" />
	Time on the server is ${stuff}

</body>
</html>