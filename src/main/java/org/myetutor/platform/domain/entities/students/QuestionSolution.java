package org.myetutor.platform.domain.entities.students;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;

/**
 * Entity implementation class for Entity: QuestionSolution
 * 
 * @author neos
 */
@Entity
@Table(name = "question_solution")
public class QuestionSolution implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	private Long id;
	
	@JoinColumn(name="question_id", insertable=false, updatable=false)
	private Long questionId;
	
	@JoinColumn(name="solution_id", insertable=false, updatable=false)
	private Long solutionId;

	public Long getId() {
		return id;
	}
}
