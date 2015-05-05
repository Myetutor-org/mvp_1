package org.myetutor.platform.repository.user.answer;

import org.myetutor.platform.model.Useranswer;
import org.myetutor.platform.model.UseranswerPK;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository("userAnswerRepository")
public interface UserAnswerRepository extends CrudRepository<Useranswer, Long> {
	Useranswer findById(UseranswerPK quiestionID);
}
