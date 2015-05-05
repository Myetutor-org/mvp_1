package org.myetutor.platform.domain.entities.tutors;

import java.io.Serializable;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 * The persistent class for the useranswer database table.
 * 
 */
@Entity
@Table(name = "tutor_useranswer")
@NamedQuery(name = "TutorUseranswer.findAll", query = "SELECT u FROM TutorUseranswer u")
public class TutorUseranswer implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private TutorUseranswerPK id;

	private String useranswerExplanation;

	private String useranswerText;

	// bi-directional many-to-one association to Question
	@ManyToOne
	@JoinColumn(name = "questionID", insertable = false, updatable = false)
	private TutorQuestion question;

	// bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name = "userID", insertable = false, updatable = false)
	private TutorUser user;

	public TutorUseranswer() {
	}

	public TutorUseranswerPK getId() {
		return this.id;
	}

	public void setId(TutorUseranswerPK id) {
		this.id = id;
	}

	public String getUseranswerExplanation() {
		return this.useranswerExplanation;
	}

	public void setUseranswerExplanation(String useranswerExplanation) {
		this.useranswerExplanation = useranswerExplanation;
	}

	public String getUseranswerText() {
		return this.useranswerText;
	}

	public void setUseranswerText(String useranswerText) {
		this.useranswerText = useranswerText;
	}

	public TutorQuestion getQuestion() {
		return this.question;
	}

	public void setQuestion(TutorQuestion question) {
		this.question = question;
		this.id.setQuestionID(question.getQuestionID());
	}

	public TutorUser getUser() {
		return this.user;
	}

	public void setUser(TutorUser user) {
		this.user = user;
		this.id.setUserID(user.getUserID());
	}

}