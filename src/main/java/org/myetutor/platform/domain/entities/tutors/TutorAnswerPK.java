package org.myetutor.platform.domain.entities.tutors;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the answer database table.
 * 
 */
@Embeddable
public class TutorAnswerPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	private int answerID;

	@Column(insertable=false, updatable=false)
	private int questionID;

	public TutorAnswerPK() {
	}
	public int getAnswerID() {
		return this.answerID;
	}
	public void setAnswerID(int answerID) {
		this.answerID = answerID;
	}
	public int getQuestionID() {
		return this.questionID;
	}
	public void setQuestionID(int questionID) {
		this.questionID = questionID;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof TutorAnswerPK)) {
			return false;
		}
		TutorAnswerPK castOther = (TutorAnswerPK)other;
		return 
			(this.answerID == castOther.answerID)
			&& (this.questionID == castOther.questionID);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.answerID;
		hash = hash * prime + this.questionID;
		
		return hash;
	}
}