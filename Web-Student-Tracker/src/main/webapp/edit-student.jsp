<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>UNA University</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<!-- Importing JQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<!--  Importing CSS -->
<link rel="stylesheet" type="text/css" href="students.css">

<!--  Importing Required classes -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- OLD VERSION: Using JDBC -->
<%@ page import="java.util.*, com.luv2code.web.jdbc.*"%>
<!--  Loading the students -->
<%
// Get the students from the request object (sent by the servlet)
// OLD VERSION: Using JDBC
// List<Student> theStudents = (List<Student>) request.getAttribute("STUDENT_LIST");
%>

</head>

<body>
	<!-- Fixed navbar -->
	<nav class="navbar navbar-fixed-top colorNavbar">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html">Welcome!</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="nonactive"><a href="StudentControllerServlet" class="colorLink">Students List</a></li>
					<li class="nonactive"><a href="StudentControllerServlet" class="colorLink">Add Student</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>

	<div class="container theme-showcase" role="main">

		<!-- Main jumbotron for a primary marketing message or call to action -->
		<div class="jumbotron">
			<h1>Universidad Nacional de Costa Rica</h1>
			<p>The Information Systems Engineering program is offered at the Omar Dengo Campus in the Benjamín Nuñez Campus and at the Interuniversity Campus in Alajuela and is accredited at both campuses.</p>
		</div>
		<div class="page-header">
			<h1>Editing the student with id ${LOADED_STUDENT.getId()}</h1>
		</div>
		<div class="row">
			<div class="col-md-10">

				<form action="StudentControllerServlet" method="GET">
					<!-- HIDDEN FIELD TO SAVE IN COMMAND THE ACTION UPDATE-->
					<input type="hidden" name="command" value="UPDATE" />
					<!-- HIDDEN FIELD TO SAVE IN COMMAND THE ID OF THE STUDENT TO UPDATE-->
					<input type="hidden" name="id" value="${LOADED_STUDENT.getId()}" />
					<div class="form-group">
						<label for=formGroupExampleInput>First Name</label> <input type="text" class="form-control" id="firstName" name="firstName" value="${LOADED_STUDENT.getFirstName()}"
							placeholder="${LOADED_STUDENT.getFirstName()}" minlength="3" maxlength="200" required>
					</div>
					<div class="form-group">
						<label for=formGroupExampleInput2>Last Name</label> <input type="text" class="form-control" id="lastName" name="lastName" value="${LOADED_STUDENT.getLastName()}"
							placeholder="${LOADED_STUDENT.getLastName()}" minlength="3" maxlength="200" required>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">Email address</label> <input type="email" class="form-control" id="email" name="email" value="${LOADED_STUDENT.getEmail()}"
							placeholder="${LOADED_STUDENT.getEmail()}" minlength="7" maxlength="200" required> <small class="form-text text-muted">We'll never share your email or any information with anyone else outside of the university</small>
					</div>
					<button type="submit" class="btn btn-primary">Update</button>
				</form>
			</div>
		</div>

	</div>
	<!-- /container -->

</body>

</html>