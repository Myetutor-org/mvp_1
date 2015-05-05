package org.myetutor.platform.domain.entities.tutors;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the questionpicture database table.
 * 
 */
@Entity
@Table(name="tutor_questionpicture")
@NamedQuery(name="TutorQuestionpicture.findAll", query="SELECT q FROM TutorQuestionpicture q")
public class TutorQuestionpicture implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int questionPictureID;

	private String questionPicturePath;

	//bi-directional many-to-many association to Question
	@ManyToMany
	@JoinTable(
		name="tutor_question_has_questionpicture"
		, joinColumns={
			@JoinColumn(name="questionPictureID")
			}
		, inverseJoinColumns={
			@JoinColumn(name="questionID")
			}
		)
	private List<TutorQuestion> questions;

	public TutorQuestionpicture() {
	}

	public int getQuestionPictureID() {
		return this.questionPictureID;
	}

	public void setQuestionPictureID(int questionPictureID) {
		this.questionPictureID = questionPictureID;
	}

	public String getQuestionPicturePath() {
		return this.questionPicturePath;
	}

	public void setQuestionPicturePath(String questionPicturePath) {
		this.questionPicturePath = questionPicturePath;
	}

	public List<TutorQuestion> getQuestions() {
		return this.questions;
	}

	public void setQuestions(List<TutorQuestion> questions) {
		this.questions = questions;
	}

}