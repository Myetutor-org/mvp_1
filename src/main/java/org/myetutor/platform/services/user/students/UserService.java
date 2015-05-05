package org.myetutor.platform.services.user.students;

import java.util.List;

import org.myetutor.platform.domain.entities.tutors.TutorUser;

public interface UserService {
	/**
     * Creates a new user.
     * @param created   The information of the created user.
     * @return  The created user.
     */
    public TutorUser create(TutorUser created);
 
    /**
     * Deletes a user.
     * @param userId  The id of the deleted user.
     * @return  The deleted user.
     * @throws UserNotFoundException  if no user is found with the given id.
     */
    public TutorUser delete(Long userId) throws UserNotFoundException;
 
    /**
     * Finds all users.
     * @return  A list of users.
     */
    public List<TutorUser> findAll();
 
    /**
     * Finds user by id.
     * @param id    The id of the wanted user.
     * @return  The found user. If no user is found, this method returns null.
     */
    public TutorUser findById(Long id);
 
    /**
     * Updates the information of a user.
     * @param updated   The information of the updated user.
     * @return  The updated user.
     * @throws UserNotFoundException  if no user is found with given id.
     */
    public TutorUser update(TutorUser updated) throws UserNotFoundException;
}
