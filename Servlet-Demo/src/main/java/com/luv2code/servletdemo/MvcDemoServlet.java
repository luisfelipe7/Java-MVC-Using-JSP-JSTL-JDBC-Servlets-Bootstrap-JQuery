package com.luv2code.servletdemo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MvcDemoServlet
 */
@WebServlet("/MvcDemoServlet")
public class MvcDemoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MvcDemoServlet() {
	super();
	// TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	
	/* Setting our own code */
	
	// Step 0: Add Data
	String[] students = {"Felipe","Yenifer","Guillermo"};
	request.setAttribute("students_list",students);
	
	// Step 1: Get Request Dispatcher
	RequestDispatcher dispatcher = request.getRequestDispatcher("/view_students.jsp");
	
	// Step 2: Forward the request to JSP
	dispatcher.forward(request,response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	// TODO Auto-generated method stub
	doGet(request, response);
    }

}
