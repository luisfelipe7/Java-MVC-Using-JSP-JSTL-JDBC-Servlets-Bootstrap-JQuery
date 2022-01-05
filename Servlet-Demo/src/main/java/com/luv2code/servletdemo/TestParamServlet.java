package com.luv2code.servletdemo;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestParamServlet
 */
@WebServlet("/TestParamServlet")
public class TestParamServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestParamServlet() {
	super();
	// TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	/* Creating my own code to read the web.xml file */

	// Step 1: Set content type
	response.setContentType("text/html");

	// Step 2: Get printwriter
	PrintWriter out = response.getWriter();

	// Step 3: Read configuration params
	ServletContext context = getServletContext(); // inherit from HttpServlet
	String maxCartSize = context.getInitParameter("max-shopping-cart-size");
	String teamName = context.getInitParameter("project-team-name");

	// Step 3.1: Read PER-SERVLET parameter
	String theGreetingMessage = getInitParameter("greeting");
	String theServiceLevel = getInitParameter("serviceLevel");

	// Step 4: Generate HTML Content
	out.println("<html><body>");
	out.println("<h1> Information for Web.xml </h1>");
	out.println("<hr>");
	out.println("<h3>Parameters</h3>");
	out.println("Max Cart: " + maxCartSize + " <br>");
	out.println("Team Name: " + teamName + " <br>");
	out.println("<h3>Per Servlet Params</h3>");
	out.println("greeting: " + theGreetingMessage);
	out.println("<br/><br/>");
	out.println("serviceLevel: " + theServiceLevel);
	out.println("</body></html>");
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
