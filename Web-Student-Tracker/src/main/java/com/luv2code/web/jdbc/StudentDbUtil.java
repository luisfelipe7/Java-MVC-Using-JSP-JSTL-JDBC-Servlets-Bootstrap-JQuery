/**
 * 
 */
package com.luv2code.web.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.mysql.cj.xdevapi.Statement;

/**
 * @author Felipe Castro
 *
 */
public class StudentDbUtil {
	/* This class is a DAO to access the database and verify the elements */
	private DataSource dataSource;

	public StudentDbUtil(DataSource theDataSource) {
		dataSource = theDataSource;
	}

	/*
	 * Obtaining the students from the database
	 */
	public List<Student> getStudents() throws Exception {
		List<Student> students = new ArrayList<>();

		Connection myConn = null;
		java.sql.Statement myStmt = null;
		ResultSet myRs = null;

		try {
			// Get a Connection
			myConn = dataSource.getConnection();
			// Create a SQL statement
			String sql = "select * from student order by last_name, first_name";
			myStmt = myConn.createStatement();
			// Execute the query
			myRs = ((java.sql.Statement) myStmt).executeQuery(sql);
			// Process the result set
			while (myRs.next()) {
				// Retrieve data from result set row
				int id = myRs.getInt("id");
				String firstName = myRs.getString("first_name");
				String lastName = myRs.getString("last_name");
				String email = myRs.getString("email");

				// Create new student object
				Student tempStudent = new Student(id, firstName, lastName, email);

				// Add it to our list of students
				students.add(tempStudent);

			}
			return students;

		} finally {
			// Close JDBC Objects to avoid memory leak
			close(myConn, myStmt, myRs);

		}

	}

	public void addStudent(Student studentToAdd) throws Exception {
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;

		try {
			// Get a Connection
			myConn = dataSource.getConnection();
			// Create a SQL statement
			String sql = "insert into student " + "(first_name, last_name, email) " + "values (?, ?, ?)";
			myStmt = myConn.prepareStatement(sql);
			// Set the param values for the student
			myStmt.setString(1, studentToAdd.getFirstName());
			myStmt.setString(2, studentToAdd.getLastName());
			myStmt.setString(3, studentToAdd.getEmail());

			// Execute the query
			myStmt.execute();

		} finally {
			// Close JDBC Objects to avoid memory leak
			close(myConn, myStmt, myRs);

		}

	}

	public void updateStudent(Student studentToUpdate) throws Exception {
		// Preparing the elements to update the student
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;

		try {
			// Get a Connection
			myConn = dataSource.getConnection();
			// Create a SQL statement
			String sql = "update student set first_name=?, last_name=?, email=? " + "where id=?";
			myStmt = myConn.prepareStatement(sql);
			// Set the param values for the student
			myStmt.setString(1, studentToUpdate.getFirstName());
			myStmt.setString(2, studentToUpdate.getLastName());
			myStmt.setString(3, studentToUpdate.getEmail());
			myStmt.setInt(4, studentToUpdate.getId());

			// Execute the query
			myStmt.execute();

		} finally {
			// Close JDBC Objects to avoid memory leak
			close(myConn, myStmt, myRs);

		}

	}

	public Student loadStudent(String studentId) throws Exception {
		// Preparing the elements to load the student
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;
		Student studentToAdd = null;

		try {
			// Get a Connection
			myConn = dataSource.getConnection();
			// Create a SQL statement
			String sql = "select * from student where id=?";
			// Prepare Statement
			myStmt = myConn.prepareStatement(sql);
			// Set Params
			myStmt.setInt(1, Integer.parseInt(studentId));

			// Execute the query
			myRs = myStmt.executeQuery();

			// Process the result set
			if (myRs.next()) {
				studentToAdd = new Student(myRs.getInt("id"), myRs.getString("first_name"), myRs.getString("last_name"),
						myRs.getString("email"));
			} else {
				throw new Exception("Could not find student id: " + studentId);
			}
			return studentToAdd;

		} finally {
			// Close JDBC Objects to avoid memory leak
			close(myConn, myStmt, myRs);
		}
	}

	public void deleteStudent(int idStudentToDelete) throws Exception {
		// Preparing the elements to delete the student
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;

		try {
			// Get a Connection
			myConn = dataSource.getConnection();
			// Create a SQL statement
			String sql = "delete from student" + " where id=?";
			myStmt = myConn.prepareStatement(sql);
			// Set the param values for the student
			myStmt.setInt(1, idStudentToDelete);
			// Execute the query
			myStmt.execute();

		} finally {
			// Close JDBC Objects to avoid memory leak
			close(myConn, myStmt, myRs);

		}

	}

	private void close(Connection myConn, java.sql.Statement myStmt, ResultSet myRs) {
		try {
			if (myRs != null) {
				myRs.close();
			}
			if (myStmt != null) {
				myStmt.close();
			}
			if (myConn != null) {
				myConn.close();
			}
		} catch (Exception exc) {
			exc.printStackTrace();
		}

	}

}
