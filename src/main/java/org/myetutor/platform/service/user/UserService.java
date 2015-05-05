package org.myetutor.platform.service.user;

import java.util.List;

import org.myetutor.platform.model.User;

public interface UserService {
	/**
     * Creates a new user.
     * @param created   The information of the created user.
     * @return  The created user.
     */
    public User create(User created);
 
    /**
     * Deletes a user.
     * @param userId  The id of the deleted user.
     * @return  The deleted user.
     * @throws UserNotFoundException  if no user is found with the given id.
     */
    public User delete(Long userId) throws UserNotFoundException;
 
    /**
     * Finds all users.
     * @return  A list of users.
     */
    public List<User> findAll();
 
    /**
     * Finds user by id.
     * @param id    The id of the wanted user.
     * @return  The found user. If no user is found, this method returns null.
     */
    public User findById(Long id);
 
    /**
     * Updates the information of a user.
     * @param updated   The information of the updated user.
     * @return  The updated user.
     * @throws UserNotFoundException  if no user is found with given id.
     */
    public User update(User updated) throws UserNotFoundException;
}
