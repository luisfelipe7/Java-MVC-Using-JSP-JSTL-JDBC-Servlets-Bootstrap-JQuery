<html>
<head>
<%!String makeItLower(String data) {
		return data.toLowerCase();
	}%>

</head>

<body>
	Lower Case "Hello World":
	<%=makeItLower("Hello World")%>
</body>

</html>