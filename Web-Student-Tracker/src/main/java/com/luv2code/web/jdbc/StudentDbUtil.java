/**
 * 
 */
package com.luv2code.web.jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	    close(myConn,myStmt,myRs);

	}

    }

    private void close(Connection myConn, java.sql.Statement myStmt, ResultSet myRs) {
	try {
	    if(myRs !=null) {
		myRs.close();
	    }
	    if(myStmt !=null) {
		myStmt.close();
	    }
	    if(myConn !=null) {
		myConn.close();
	    }
	}catch(Exception exc) {
	    exc.printStackTrace();
	}
	
    }

}
