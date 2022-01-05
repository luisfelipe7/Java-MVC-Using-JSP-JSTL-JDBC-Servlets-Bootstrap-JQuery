<!--  Using an import to load the class -->
<%@ page import="com.luv2code.jsp.FunUtils" %>
<html>
<head>

</head>
<body>
	<!--  Using an expression and calling a method from a class -->
	Let's have some fun:
	<%=FunUtils.makeItLower("FUN FUN FUN")%>
</body>
</html>