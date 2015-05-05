package org.myetutor.platform.domain.entities.tutors;

import java.io.Serializable;

import javax.persistence.*;

import java.util.List;


/**
 * The persistent class for the user database table.
 * 
 */
@Entity
@Table(name="tutor_user")
@NamedQuery(name="TutorUser.findAll", query="SELECT u FROM TutorUser u")
public class TutorUser implements Serializable {
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
	private List<TutorUseranswer> useranswers;

	public TutorUser() {
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

	public List<TutorUseranswer> getUseranswers() {
		return this.useranswers;
	}

	public void setUseranswers(List<TutorUseranswer> useranswers) {
		this.useranswers = useranswers;
	}

	public TutorUseranswer addUseranswer(TutorUseranswer useranswer) {
		getUseranswers().add(useranswer);
		useranswer.setUser(this);

		return useranswer;
	}

	public TutorUseranswer removeUseranswer(TutorUseranswer useranswer) {
		getUseranswers().remove(useranswer);
		useranswer.setUser(null);

		return useranswer;
	}

}