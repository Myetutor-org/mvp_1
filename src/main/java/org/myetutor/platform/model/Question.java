package org.myetutor.platform.model;

import java.io.Serializable;

import javax.persistence.*;

import java.util.List;


/**
 * The persistent class for the question database table.
 * 
 */
@Entity
@Table(name="question")
@NamedQuery(name="Question.findAll", query="SELECT q FROM Question q")
public class Question implements Serializable {
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
	private List<Answer> answers;

	//bi-directional many-to-many association to Questionpicture
	@ManyToMany(mappedBy="questions")
	private List<Questionpicture> questionpictures;

	//bi-directional many-to-one association to Useranswer
	@OneToMany(mappedBy="question")
	private List<Useranswer> useranswers;

	public Question() {
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

	public List<Answer> getAnswers() {
		return this.answers;
	}

	public void setAnswers(List<Answer> answers) {
		this.answers = answers;
	}

	public Answer addAnswer(Answer answer) {
		getAnswers().add(answer);
		answer.setQuestion(this);

		return answer;
	}

	public Answer removeAnswer(Answer answer) {
		getAnswers().remove(answer);
		answer.setQuestion(null);

		return answer;
	}

	public List<Questionpicture> getQuestionpictures() {
		return this.questionpictures;
	}

	public void setQuestionpictures(List<Questionpicture> questionpictures) {
		this.questionpictures = questionpictures;
	}

	public List<Useranswer> getUseranswers() {
		return this.useranswers;
	}

	public void setUseranswers(List<Useranswer> useranswers) {
		this.useranswers = useranswers;
	}

	public Useranswer addUseranswer(Useranswer useranswer) {
		getUseranswers().add(useranswer);
		useranswer.setQuestion(this);

		return useranswer;
	}

	public Useranswer removeUseranswer(Useranswer useranswer) {
		getUseranswers().remove(useranswer);
		useranswer.setQuestion(null);

		return useranswer;
	}

}