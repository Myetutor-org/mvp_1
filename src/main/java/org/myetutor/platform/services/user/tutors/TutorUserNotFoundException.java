package org.myetutor.platform.services.user.tutors;


public class TutorUserNotFoundException extends Exception {

	private static final long serialVersionUID = 1L;

	public TutorUserNotFoundException(String message) {
		super(message);
	}
	
	public TutorUserNotFoundException(Throwable throwable) {
		super(throwable);
	}
}
