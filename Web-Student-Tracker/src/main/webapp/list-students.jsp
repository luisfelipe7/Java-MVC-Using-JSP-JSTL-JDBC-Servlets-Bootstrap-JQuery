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
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<!--  Importing CSS -->
<link rel="stylesheet" href="students.css">

<!--  Importing Required classes -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*, com.luv2code.web.jdbc.*"%>

<!--  Loading the students -->
<%
// Get the students from the request object (sent by the servlet)
List<Student> theStudents = (List<Student>) request.getAttribute("STUDENT_LIST");
%>

</head>

<body>
	<!-- Fixed navbar -->
	<nav class="navbar navbar-fixed-top colorNavbar">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Welcome!</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active">
						<a href="#">Students List</a>
					</li>
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
			<h1>List of Students</h1>
		</div>
		<div class="row">
			<div class="col-md-10">
				<table class="table table-responsive-xl table-bordered table-striped table-hover">
					<thead class="thead">
						<tr>
							<th>ID</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Email</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<%
						for (Student tempStudent : theStudents) {
						%>
						<tr>
							<td><%=tempStudent.getId()%></td>
							<td><%=tempStudent.getFirstName()%></td>
							<td><%=tempStudent.getLastName()%></td>
							<td><%=tempStudent.getEmail()%></td>
							<td>
								<button type="button" class="btn btn-info">Edit</button>
								<button type="button" class="btn btn-danger">Delete</button>
							</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>
		</div>

	</div>
	<!-- /container -->

</body>

</html>