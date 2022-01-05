<!DOCTYPE html>

<html lang="en">
<!-- This is the head of my HTML File -->

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie-edge" />
<!-- Importing the tag library -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Importing the utils class and the Student Object -->
<%@ page import="java.util.*, com.luv2code.jsp.tagdemo.Student"%>
<!--  Importing CSS -->
<link rel="stylesheet" href="forEachStudent.css">

<!-- Setting the sample data -->
<%
// Just Create some sample data (usually provided by MVC)
List<Student> data = new ArrayList<>();
data.add(new Student("Felipe", "Castro", true));
data.add(new Student("Yenifer", "Esquivel", false));
data.add(new Student("Esteban", "Castro", true));
pageContext.setAttribute("myStudents", data);
%>

<title>JSTL TAGS</title>
</head>


<!-- This is the body of my HTML File -->
<body>
	<h1>Implementing JSTL For Each with Student Objects</h1>
	<hr>
	<!--  Using the JSTL TAGS -->
	<h3>Here are some provinces of Costa Rica:</h3>
	<table>
		<tr>
			<th>Name</th>
			<th>Last Name</th>
			<th>Gold Customer</th>
		</tr>
		<c:forEach var="student" items="${myStudents}">
			<tr>
				<td>${student.firstName}</td>
				<td>${student.lastName}</td>
				<c:if test="${student.goldCustomer}">
					<td>The Student has a special discount</td>
				</c:if>
				<c:if test="${not student.goldCustomer}">
					<td>The Student does not have a special discount</td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
</body>
</html>