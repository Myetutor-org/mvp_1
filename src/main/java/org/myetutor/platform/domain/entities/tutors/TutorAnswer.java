package org.myetutor.platform.domain.entities.tutors;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the answer database table.
 * 
 */
@Entity
@Table(name="tutor_answer")
@NamedQuery(name="TutorAnswer.findAll", query="SELECT a FROM TutorAnswer a")
public class TutorAnswer implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private TutorAnswerPK id;

	private String answerText;

	//bi-directional many-to-one association to Question
	@ManyToOne
	@JoinColumn(name="questionID", insertable=false, updatable=false)
	private TutorQuestion question;

	public TutorAnswer() {
	}

	public TutorAnswerPK getId() {
		return this.id;
	}

	public void setId(TutorAnswerPK id) {
		this.id = id;
	}

	public String getAnswerText() {
		return this.answerText;
	}

	public void setAnswerText(String answerText) {
		this.answerText = answerText;
	}

	public TutorQuestion getQuestion() {
		return this.question;
	}

	public void setQuestion(TutorQuestion question) {
		this.question = question;
	}

}