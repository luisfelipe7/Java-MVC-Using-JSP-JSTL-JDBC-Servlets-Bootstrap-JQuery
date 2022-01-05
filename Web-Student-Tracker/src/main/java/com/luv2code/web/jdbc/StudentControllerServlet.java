package com.luv2code.web.jdbc;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * Servlet implementation class StudentControllerServlet
 */
@WebServlet("/StudentControllerServlet")
public class StudentControllerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /*
     * Implementing our logic
     */
    private StudentDbUtil studentDbUtil;
    @Resource(name = "jdbc/web_student_tracker")
    private DataSource dataSource;

    /*
     * This method is executed when the server is loaded
     */
    @Override
    public void init() throws ServletException {
	// TODO Auto-generated method stub
	super.init();

	// Create our student db util and pass the pool connection / data source
	try {
	    studentDbUtil = new StudentDbUtil(dataSource);
	} catch (Exception exc) {
	    throw new ServletException(exc);
	}
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	// Implementing custom code to update/load the model and send it to the view

	// List the student in MVC
	try {
	    listStudents(request, response);
	} catch (Exception exc) {
	    throw new ServletException(exc);
	}

    }

    private void listStudents(HttpServletRequest request, HttpServletResponse response) throws Exception {

	// Get the students from db util
	List<Student> students = studentDbUtil.getStudents();

	// Add students to the request
	request.setAttribute("STUDENT_LIST", students);

	// Send to JSP Page (view)
	RequestDispatcher dispatcher = request.getRequestDispatcher("/list-students.jsp");
	dispatcher.forward(request, response);

    }

}
