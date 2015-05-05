package org.myetutor.platform.domain.repositories.user.answer;

import org.myetutor.platform.domain.entities.tutors.TutorUseranswer;
import org.myetutor.platform.domain.entities.tutors.TutorUseranswerPK;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository("userAnswerRepository")
public interface UserAnswerRepository extends CrudRepository<TutorUseranswer, Long> {
	TutorUseranswer findById(TutorUseranswerPK quiestionID);
}
