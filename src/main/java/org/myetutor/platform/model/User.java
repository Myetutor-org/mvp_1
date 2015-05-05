package org.myetutor.platform.model;

import java.io.Serializable;

import javax.persistence.*;

import java.util.List;


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
	private int userID;

	private String userEmail;

	private String userName;

	private String userSurname;

	private String userTelNo;

	//bi-directional many-to-one association to Useranswer
	@OneToMany(mappedBy="user")
	private List<Useranswer> useranswers;

	public User() {
	}

	public int getUserID() {
		return this.userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getUserEmail() {
		return this.userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserSurname() {
		return this.userSurname;
	}

	public void setUserSurname(String userSurname) {
		this.userSurname = userSurname;
	}

	public String getUserTelNo() {
		return this.userTelNo;
	}

	public void setUserTelNo(String userTelNo) {
		this.userTelNo = userTelNo;
	}

	public List<Useranswer> getUseranswers() {
		return this.useranswers;
	}

	public void setUseranswers(List<Useranswer> useranswers) {
		this.useranswers = useranswers;
	}

	public Useranswer addUseranswer(Useranswer useranswer) {
		getUseranswers().add(useranswer);
		useranswer.setUser(this);

		return useranswer;
	}

	public Useranswer removeUseranswer(Useranswer useranswer) {
		getUseranswers().remove(useranswer);
		useranswer.setUser(null);

		return useranswer;
	}

}