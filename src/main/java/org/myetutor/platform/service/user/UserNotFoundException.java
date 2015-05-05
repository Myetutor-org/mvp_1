package org.myetutor.platform.service.user;


public class UserNotFoundException extends Exception {

	private static final long serialVersionUID = 1L;

	public UserNotFoundException(String message) {
		super(message);
	}
	
	public UserNotFoundException(Throwable throwable) {
		super(throwable);
	}
}
