package org.myetutor.platform.domain.repositories.question;

import java.util.List;

import org.myetutor.platform.domain.entities.tutors.TutorQuestion;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository("questionRepository")
public interface QuestionRepository extends CrudRepository<TutorQuestion, Long> {
	List<TutorQuestion> findAllByQuestionWeight(int weight);
	TutorQuestion findByQuestionID(int id);
}
