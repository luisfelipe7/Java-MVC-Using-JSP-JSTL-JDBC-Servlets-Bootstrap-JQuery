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
			// Reading the command value to verify which action we need to apply
			String theCommand = request.getParameter("command");
			// Then base on the value route to the appropriate route, if theCommand is
			// null/missing the default route is list
			if (theCommand != null) {
				if (theCommand.equals("LOAD")) {
					loadStudent(request, response);
				} else {
					if (theCommand.equals("UPDATE")) {
						updateStudent(request, response);
					} else {
						if (theCommand.equals("DELETE")) {
							deleteStudent(request, response);
						} else {
							listStudents(request, response);
						}
					}
				}

			} else {
				listStudents(request, response);
			}

		} catch (Exception exc) {
			// Setting the error message
			request.setAttribute("ERROR_MESSAGE", "Something went wrong!");

			throw new ServletException(exc);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Implementing custom code to update/load the model and send it to the view

		// List the student in MVC
		try {
			// Reading the command value to verify which action we need to apply
			String theCommand = request.getParameter("command");
			// Then base on the value route to the appropriate route, if theCommand is
			// null/missing the default route is list
			if (theCommand != null) {
				if (theCommand.equals("ADD")) {
					addStudent(request, response);
				} else {
					if (theCommand.equals("SEARCH")) {
						searchStudent(request, response);
					} else {
						listStudents(request, response);
					}
				}
			} else {
				listStudents(request, response);
			}

		} catch (Exception exc) {
			// Setting the error message
			request.setAttribute("ERROR_MESSAGE", "Something went wrong!");

			throw new ServletException(exc);
		}

	}

	private void searchStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// Capturing the information about the student to search
		String firstNameToSearch = request.getParameter("searchValue");

		if (firstNameToSearch != null) {
			if (firstNameToSearch.equals("")) {
				// Setting the error message
				request.setAttribute("ERROR_MESSAGE", "Please enter a student to search!");
				// Updating/Charging the list again
				listStudents(request, response);
			} else {
				// Calling the method in charge of searching the student
				List<Student> students = studentDbUtil.search(firstNameToSearch);

				// Add students to the request
				request.setAttribute("STUDENT_LIST", students);

				if (students.isEmpty()) {
					// Setting the error message
					request.setAttribute("ERROR_MESSAGE", "No results found with the entered text!");
				}

				// Send to JSP Page (view)
				RequestDispatcher dispatcher = request.getRequestDispatcher("/list-students.jsp");
				dispatcher.forward(request, response);
			}

		} else {
			// Do nothing because the id of the student to search is null
			// Setting the error message
			request.setAttribute("ERROR_MESSAGE", "Please enter a student to search!");
			// Updating/Charging the list again
			listStudents(request, response);
		}

	}

	private void deleteStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// Capturing the information about the student to delete
		int idStudentToDelete = Integer.parseInt(request.getParameter("studentId"));

		// Sending the student to be deleted
		if (idStudentToDelete != 0) {
			// Calling the method in charge of deleting the student
			studentDbUtil.deleteStudent(idStudentToDelete);
			// Setting the success message
			request.setAttribute("SUCCESS_MESSAGE", "Student Deleted Sucessfully!");

			// Updating/Charging the list again
			listStudents(request, response);
		} else {
			// Do nothing because the id of the student to delete is 0
			// Setting the error message
			request.setAttribute("ERROR_MESSAGE", "Something went wrong!");
			// Updating/Charging the list again
			listStudents(request, response);

		}

	}

	private void updateStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// Creating Student to Update
		int id = Integer.parseInt(request.getParameter("id"));
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		Student studentToUpdate = new Student(id, firstName, lastName, email);

		// Sending the student to be updated
		if (studentToUpdate != null) {
			// Calling the method to update the student
			studentDbUtil.updateStudent(studentToUpdate);
			// Setting the success message
			request.setAttribute("SUCCESS_MESSAGE", "Student Updated Sucessfully!");

			listStudents(request, response);
		} else {
			// Do nothing because the student to update is null

			// Setting the error message
			request.setAttribute("ERROR_MESSAGE", "Something went wrong!");
			// Updating/Charging the list again
			listStudents(request, response);
		}

	}

	private void loadStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// Read Student ID from the request
		String studentId = request.getParameter("studentId");

		// Load the student from the database
		Student studentToLoad = studentDbUtil.loadStudent(studentId);

		// Setting the information to the request
		if (studentToLoad != null) {
			request.setAttribute("LOADED_STUDENT", studentToLoad);

			// Send to JSP Page (view)
			RequestDispatcher dispatcher = request.getRequestDispatcher("/edit-student.jsp");
			dispatcher.forward(request, response);
		} else {
			// Do nothing because the student loaded is null

			// Setting the error message
			request.setAttribute("ERROR_MESSAGE", "Something went wrong!");
			// Updating/Charging the list again
			listStudents(request, response);
		}
	}

	private void addStudent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// Read Student Info from form data
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");

		// Create a new student object
		Student studentToAdd = new Student(firstName, lastName, email);

		// Add the student to the data
		studentDbUtil.addStudent(studentToAdd);
		// Setting the success message
		request.setAttribute("SUCCESS_MESSAGE", "Student Added Sucessfully!");

		// Send back to main page (the student list)
		response.sendRedirect(request.getContextPath() + "/StudentControllerServlet?command=LIST");
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
