<!DOCTYPE html>

<html lang="en">
<!-- This is the head of my HTML File -->

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie-edge" />
<!--  Importing the classes that we need -->
<%@ page import="java.util.*"%>
<title>JSP/Using Sessions</title>
</head>


<!-- This is the body of my HTML File -->
<body>
	<h1>Learning about sessions using JSP</h1>

	<!--  Step #1: Create the HTML Form -->
	<form action="todo-demo.jsp">
		Add new item:
		<input type="text" name="itemToAdd" />
		<input type="submit" value="submit" />

	</form>
	<br>
	Last item added:
	<%
	if (session.getAttribute("lastItemAdded") == null) {
	    out.println("No objects were added");
	} else {
	    out.println(session.getAttribute("lastItemAdded"));
	}
	%>

	<!--  Step #2: Add new item to "To Do" List -->
	<%
	// a) Get the TO DO items from the session
	List<String> items = (List<String>) session.getAttribute("myToDoList");

	// b) If the TO DO items doesn't exist, then create a new one
	if (items == null) {
	    //We need to create a new list
	    items = new ArrayList<String>();
	    session.setAttribute("myToDoList", items);
	}
	// c) Check if there is an item to add
	// Now we have the list created and we need to capture the string
	String itemToAdd = request.getParameter("itemToAdd");
	if (itemToAdd != null && (!(itemToAdd.isBlank()))) {
	    items.add(itemToAdd);
	    session.setAttribute("lastItemAdded", itemToAdd);
	    response.sendRedirect("todo-demo.jsp");
	}

	//	Step #3: Display all "To Do" item from session
	out.println("<hr><h2>" + "To Do List Items:  " + "</h2>");
	if (items.size() == 0) {
	    out.println("<p>" + "No items have been added yet" + "</p>");
	} else {
	    out.println("<ol>");
	    for (String item : items) {
		out.println("<li>" + item + "</li>");
	    }
	    out.println("</ol>");
	}
	%>
</body>
</html>