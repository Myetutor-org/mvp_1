package org.myetutor.platform.domain.repositories.user.answer;

import org.myetutor.platform.domain.entities.Useranswer;
import org.myetutor.platform.domain.entities.UseranswerPK;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository("userAnswerRepository")
public interface UserAnswerRepository extends CrudRepository<Useranswer, Long> {
	Useranswer findById(UseranswerPK quiestionID);
}
