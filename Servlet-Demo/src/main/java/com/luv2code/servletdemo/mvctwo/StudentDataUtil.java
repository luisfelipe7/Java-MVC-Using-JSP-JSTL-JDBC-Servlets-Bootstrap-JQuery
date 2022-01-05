package com.luv2code.servletdemo.mvctwo;

import java.util.ArrayList;
import java.util.List;

public class StudentDataUtil {
    public static List<Student> getStudents(){
	// Create an empty list
	List<Student> students = new ArrayList<>();
	
	// Adding a sample data
	students.add(new Student("Mary","Public","mary@luv2code.com"));
	students.add(new Student("Luis","Doe","luis@luv2code.com"));
	students.add(new Student("Yenifer","Esquivel","yenifer@luv2code.com"));

	// Return the list
	return students;
    }
}
