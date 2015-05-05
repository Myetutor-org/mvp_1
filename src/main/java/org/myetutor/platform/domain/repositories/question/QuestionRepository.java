package org.myetutor.platform.domain.repositories.question;

import java.util.List;

import org.myetutor.platform.domain.entities.Question;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository("questionRepository")
public interface QuestionRepository extends CrudRepository<Question, Long> {
	List<Question> findAllByQuestionWeight(int weight);
	Question findByQuestionID(int id);
}
