package org.myetutor.platform.domain.entities;

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
@NamedQuery(name = "Useranswer.findAll", query = "SELECT u FROM Useranswer u")
public class Useranswer implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private UseranswerPK id;

	private String useranswerExplanation;

	private String useranswerText;

	// bi-directional many-to-one association to Question
	@ManyToOne
	@JoinColumn(name = "questionID", insertable = false, updatable = false)
	private Question question;

	// bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name = "userID", insertable = false, updatable = false)
	private User user;

	public Useranswer() {
	}

	public UseranswerPK getId() {
		return this.id;
	}

	public void setId(UseranswerPK id) {
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

	public Question getQuestion() {
		return this.question;
	}

	public void setQuestion(Question question) {
		this.question = question;
		this.id.setQuestionID(question.getQuestionID());
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
		this.id.setUserID(user.getUserID());
	}

}