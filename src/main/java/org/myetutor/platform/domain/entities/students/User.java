package org.myetutor.platform.domain.entities.students;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;


/**
 * The persistent class for the user database table.
 * 
 */
@Entity
@Table(name="user")
@NamedQuery(name="User.findAll", query="SELECT u FROM User u")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	public static final String USER = "user";

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int iD;

	private String userEmail;

	private String name;

	private String surname;

	public User() {
	}

	public int getUserID() {
		return this.iD;
	}

	public void setUserID(int userID) {
		this.iD = userID;
	}

	public String getUserEmail() {
		return this.userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserName() {
		return this.name;
	}

	public void setUserName(String userName) {
		this.name = userName;
	}

	public String getUserSurname() {
		return this.surname;
	}

	public void setUserSurname(String userSurname) {
		this.surname = userSurname;
	}
}