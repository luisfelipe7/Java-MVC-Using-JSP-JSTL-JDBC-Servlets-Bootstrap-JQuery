<!DOCTYPE html>

<html lang="en">
<!-- This is the head of my HTML File -->

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie-edge" />
<title>JSP/Forms Confirmation</title>
</head>


<!-- This is the body of my HTML File -->
<body>
	<h1>Student Confirmation</h1>
	<h4>Information about the student confirmed is:</h4>
	First Name:
	<%=request.getParameter("firstName")%>
	<br>
	Last Name:
	<%=request.getParameter("lastName")%>
	<br>
	Country:
	<%=request.getParameter("country")%>
	<br>
	Favorite Programming Language:
	<%=request.getParameter("favoriteLanguage")%>
	<br>
	Complete Information: ${param.firstName} - ${param.lastName} - ${param.country} - ${param.favoriteLanguage}
</body>
</html>
