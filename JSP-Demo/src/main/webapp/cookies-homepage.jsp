<!DOCTYPE html>

<html lang="en">
<!-- This is the head of my HTML File -->

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie-edge" />
<%@ page import="java.net.URLDecoder" %>
<title>JSP/Training Portal</title>
</head>


<!-- This is the body of my HTML File -->
<body>
	<h1>Home Page</h1>

	<!-- Reading the Cookies to get the favorite programming language -->
	<%
	// The default language if there are no cookies
	String favoriteLanguage = "Java";
	// Getting the cookies
	Cookie[] theCookies = request.getCookies();
	// Finding the cookie that has the favorite language
	if (theCookies != null) {
	    for (Cookie tempCookie : theCookies) {
		if ("myApp.favoriteLanguage".equals(tempCookie.getName())) {
	    favoriteLanguage = URLDecoder.decode(tempCookie.getValue(), "UTF-8");
	    break;
		}
	    }
	}
	%>

	<!-- Now showing the personalized information based on the cookies -->
	<h4>
		New Books for
		<%=favoriteLanguage%></h4>
	<ul>
		<li>Book #1</li>
		<li>Book #2</li>
	</ul>
	<h4>
		Latest News reports for
		<%=favoriteLanguage%></h4>
	<ul>
		<li>News #1</li>
		<li>News #2</li>
	</ul>
	<h4>
		Hot Jobs for
		<%=favoriteLanguage%></h4>
	<ul>
		<li>Jobs #1</li>
		<li>Jobs #2</li>
	</ul>
	<hr>

	<a href="cookies-personalize-form.html">Personalize this page</a>

</body>
</html>