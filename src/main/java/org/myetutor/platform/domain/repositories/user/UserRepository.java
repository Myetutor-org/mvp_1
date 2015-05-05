package org.myetutor.platform.domain.repositories.user;

import org.myetutor.platform.domain.entities.tutors.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository("userRepository")
public interface UserRepository extends CrudRepository<User, Long> {
	User findByUserEmail(String email);
}
