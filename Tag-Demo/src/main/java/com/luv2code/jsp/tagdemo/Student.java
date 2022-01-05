/**
 * 
 */
package com.luv2code.jsp.tagdemo;

/**
 * @author Felipe Castro
 *
 */
public class Student {
    private String firstName;
    private String lastName;
    private boolean goldCustomer;
    /**
     * @param firstName
     * @param lastName
     * @param goldCustomer
     */
    public Student(String firstName, String lastName, boolean goldCustomer) {
	super();
	this.firstName = firstName;
	this.lastName = lastName;
	this.goldCustomer = goldCustomer;
    }
    /**
     * @return the firstName
     */
    public String getFirstName() {
        return firstName;
    }
    /**
     * @param firstName the firstName to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    /**
     * @return the lastName
     */
    public String getLastName() {
        return lastName;
    }
    /**
     * @param lastName the lastName to set
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    /**
     * @return the goldCustomer
     */
    public boolean isGoldCustomer() {
        return goldCustomer;
    }
    /**
     * @param goldCustomer the goldCustomer to set
     */
    public void setGoldCustomer(boolean goldCustomer) {
        this.goldCustomer = goldCustomer;
    }
    
    
}
