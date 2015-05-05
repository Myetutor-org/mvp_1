package org.myetutor.platform.domain.repositories.user;

import org.myetutor.platform.domain.entities.tutors.TutorUser;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository("userRepository")
public interface UserRepository extends CrudRepository<TutorUser, Long> {
	TutorUser findByUserEmail(String email);
}
