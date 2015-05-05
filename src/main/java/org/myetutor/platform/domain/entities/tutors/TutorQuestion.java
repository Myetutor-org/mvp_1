package org.myetutor.platform.domain.entities.tutors;

import java.io.Serializable;

import javax.persistence.*;

import java.util.List;


/**
 * The persistent class for the question database table.
 * 
 */
@Entity
@Table(name="tutor_question")
@NamedQuery(name="TutorQuestion.findAll", query="SELECT q FROM TutorQuestion q")
public class TutorQuestion implements Serializable {
	private static final long serialVersionUID = 1L;

	public static final String QUESTION = "question";

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int questionID;

	private boolean questionExplanationFlag;

	private String questionText;

	private byte questionWeight;

	//bi-directional many-to-one association to Answer
	@OneToMany(mappedBy="question")
	private List<TutorAnswer> answers;

	//bi-directional many-to-many association to Questionpicture
	@ManyToMany(mappedBy="questions")
	private List<TutorQuestionpicture> questionpictures;

	//bi-directional many-to-one association to Useranswer
	@OneToMany(mappedBy="question")
	private List<TutorUseranswer> useranswers;

	public TutorQuestion() {
	}

	public int getQuestionID() {
		return this.questionID;
	}

	public void setQuestionID(int questionID) {
		this.questionID = questionID;
	}

	public boolean getQuestionExplanationFlag() {
		return this.questionExplanationFlag;
	}

	public void setQuestionExplanationFlag(boolean questionExplanationFlag) {
		this.questionExplanationFlag = questionExplanationFlag;
	}

	public String getQuestionText() {
		return this.questionText;
	}

	public void setQuestionText(String questionText) {
		this.questionText = questionText;
	}

	public byte getQuestionWeight() {
		return this.questionWeight;
	}

	public void setQuestionWeight(byte questionWeight) {
		this.questionWeight = questionWeight;
	}

	public List<TutorAnswer> getAnswers() {
		return this.answers;
	}

	public void setAnswers(List<TutorAnswer> answers) {
		this.answers = answers;
	}

	public TutorAnswer addAnswer(TutorAnswer answer) {
		getAnswers().add(answer);
		answer.setQuestion(this);

		return answer;
	}

	public TutorAnswer removeAnswer(TutorAnswer answer) {
		getAnswers().remove(answer);
		answer.setQuestion(null);

		return answer;
	}

	public List<TutorQuestionpicture> getQuestionpictures() {
		return this.questionpictures;
	}

	public void setQuestionpictures(List<TutorQuestionpicture> questionpictures) {
		this.questionpictures = questionpictures;
	}

	public List<TutorUseranswer> getUseranswers() {
		return this.useranswers;
	}

	public void setUseranswers(List<TutorUseranswer> useranswers) {
		this.useranswers = useranswers;
	}

	public TutorUseranswer addUseranswer(TutorUseranswer useranswer) {
		getUseranswers().add(useranswer);
		useranswer.setQuestion(this);

		return useranswer;
	}

	public TutorUseranswer removeUseranswer(TutorUseranswer useranswer) {
		getUseranswers().remove(useranswer);
		useranswer.setQuestion(null);

		return useranswer;
	}

}