<!DOCTYPE html>

<html lang="en">
<!-- This is the head of my HTML File -->

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie-edge" />
<!-- Importing the tag library -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>Servlets/JSP MVC - View Students</title>
</head>


<!-- This is the body of my HTML File -->
<body>
	<h1>View Students</h1>
	<hr>
	<h3>Here is the list of students:</h3>
	<table border="1">
		<tr>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Email</th>
		</tr>
		<c:forEach var="student" items="${student_list}">
			<tr>
				<td>${student.firstName}</td>
				<td>${student.lastName}</td>
				<td>${student.email}</td>
			</tr>
		</c:forEach>
	</table>
	<br>
</body>
</html>