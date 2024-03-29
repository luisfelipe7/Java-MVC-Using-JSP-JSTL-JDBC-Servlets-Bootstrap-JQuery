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
<!-- Importing JQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<!-- Adding the JS File to load the modal -->
<script type="text/javascript" src="modal.js"></script>


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
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html">Welcome!</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active">
						<a href="StudentControllerServlet" class="colorLink">Students List</a>
					</li>
					<li class="nonactive">
						<a href="add-student.jsp" class="colorLink">Add Student</a>
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
			<p>The Information Systems Engineering program is offered at the Omar Dengo Campus in the Benjam�n Nu�ez Campus and at the Interuniversity Campus in Alajuela and is accredited at both campuses.</p>
		</div>
		<div class="page-header">
			<h1>List of Students</h1>
			<br>
			<!-- Creating a form to post the data and do the search -->
			<form action="StudentControllerServlet" method="POST">
				<!-- HIDDEN FIELD TO SAVE IN COMMAND THE ACTION ADD-->
				<input type="hidden" name="command" value="SEARCH" />
				<input type="text" class="inputlg col-xs-5 widthSearch" name="searchValue" placeholder="Enter the name that you want to search">
				<button type="submit" class="btn btn-primary">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
</svg>
				</button>
			</form>
			<br>
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
						<!--OLD VERSION: Using JDBC 
						for (Student tempStudent : theStudents) {
						<tr>
							<td><=tempStudent.getId()%></td>
							<td><=tempStudent.getFirstName()%></td>
							<td><=tempStudent.getLastName()%></td>
							<td><=tempStudent.getEmail()%></td>
							<td>
								<button type="button" class="btn btn-info">Edit</button>
								<button type="button" class="btn btn-danger">Delete</button>
							</td>
						</tr>
						}
						%> -->

						<!-- Using JSTL -->

						<c:forEach var="student" items="${STUDENT_LIST}">
							<tr>
								<td>${student.getId()}</td>
								<td>${student.getFirstName()}</td>
								<td>${student.getLastName()}</td>
								<td>${student.getEmail()}</td>
								<td>
									<!-- Creating the update link for each student -->
									<c:url var="editLink" value="StudentControllerServlet">
										<c:param name="command" value="LOAD" />
										<c:param name="studentId" value="${student.getId()}" />
									</c:url>
									<button type="button" class="btn btn-info">
										<a href="${editLink}" class="linkButton">Update</a>
									</button>
									<!-- Creating the delete link for each student -->
									<c:url var="deleteLink" value="StudentControllerServlet">
										<c:param name="command" value="DELETE" />
										<c:param name="studentId" value="${student.getId()}" />
									</c:url>
									<!-- Button to launch the modal in charge of confirm that we want to delete the student -->
									<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteModal">Delete</button>
									<!-- Modal to confirm the delete -->
									<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h3 class="modal-title" id="exampleModalLabel">Confirm Delete</h3>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<h5>Are you sure that you want to delete the student with the id ${student.getId()} and name ${student.getFirstName()} ?</h5>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary" data-dismiss="modal">No,Close</button>
													<button type="button" class="btn btn-danger">
														<a href="${deleteLink}" class="linkButton"> Yes, Delete! </a>
													</button>
												</div>
											</div>
										</div>
									</div>

								</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>

				<!-- Displaying alert if there is a success message -->
				<c:if test="${not empty SUCCESS_MESSAGE}">
					<div class="alert alert-success alert-dismissible show" role="alert">
						<strong>${SUCCESS_MESSAGE}</strong>
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
				</c:if>
				<!-- Displaying alert if there is a error message -->
				<c:if test="${not empty ERROR_MESSAGE}">
					<div class="alert alert-danger alert-dismissible show" role="alert">
						<strong>${ERROR_MESSAGE}</strong>
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
				</c:if>

			</div>
		</div>

	</div>
	<!-- /container -->

</body>

</html>