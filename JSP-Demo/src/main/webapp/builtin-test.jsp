<html>
<head>
<h3>JSP Built-In Objects</h3>
</head>
<body>
	Request user agent:
	<%=request.getHeader("User-Agent")%>
	
<br><br>
	Request language: <%= request.getLocale() %>
</body>
</html>
