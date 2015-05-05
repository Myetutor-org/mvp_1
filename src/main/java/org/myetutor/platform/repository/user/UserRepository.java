package org.myetutor.platform.repository.user;

import org.myetutor.platform.model.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository("userRepository")
public interface UserRepository extends CrudRepository<User, Long> {
	User findByUserEmail(String email);
}
