package org.myetutor.platform.model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the useranswer database table.
 * 
 */
@Embeddable
public class UseranswerPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(insertable=false, updatable=false)
	private int userID;

	@Column(insertable=false, updatable=false)
	private int questionID;

	public UseranswerPK() {
	}
	public int getUserID() {
		return this.userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
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
		if (!(other instanceof UseranswerPK)) {
			return false;
		}
		UseranswerPK castOther = (UseranswerPK)other;
		return 
			(this.userID == castOther.userID)
			&& (this.questionID == castOther.questionID);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.userID;
		hash = hash * prime + this.questionID;
		
		return hash;
	}
}