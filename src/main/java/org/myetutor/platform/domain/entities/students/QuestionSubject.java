package org.myetutor.platform.domain.entities.students;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Entity implementation class for Entity: QuestionSubject
 * 
 * @author neos
 */
@Entity
@Table(name = "question_subject")
public class QuestionSubject implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	private Long id;

	public Long getId() {
		return id;
	}

}
