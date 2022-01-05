<!DOCTYPE html>

<html lang="en">
<!-- This is the head of my HTML File -->

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie-edge" />
<%@ page import="java.net.URLEncoder" %>
<title>JSP/Form Language Confirmation</title>
</head>


<!-- This is the body of my HTML File -->
<body>
	<h1>Form Language Confirmation</h1>
	<%
	// Reading the data about the language
	String favoriteLanguage = request.getParameter("favoriteLanguage");
	favoriteLanguage = URLEncoder.encode(favoriteLanguage, "UTF-8");

	// Creating the cookie
	Cookie theCookie = new Cookie("myApp.favoriteLanguage", favoriteLanguage);
	// Setting the life span: total number of seconds
	theCookie.setMaxAge(60 * 60 * 24 * 365);
	// Send cookie to the browser
	response.addCookie(theCookie);
	%>
	<h4>Thanks! We set your favorite language to ${param.favoriteLanguage}</h4>
	<br>
	<br>
	<a href="cookies-homepage.jsp">Return to homepage.</a>
</body>
</html>