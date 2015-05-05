package org.myetutor.platform.domain.repositories.user.answer;

import org.myetutor.platform.domain.entities.tutors.Useranswer;
import org.myetutor.platform.domain.entities.tutors.UseranswerPK;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository("userAnswerRepository")
public interface UserAnswerRepository extends CrudRepository<Useranswer, Long> {
	Useranswer findById(UseranswerPK quiestionID);
}
