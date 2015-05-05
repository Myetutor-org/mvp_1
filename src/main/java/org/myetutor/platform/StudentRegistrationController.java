package org.myetutor.platform;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.myetutor.platform.domain.entities.students.User;
import org.myetutor.platform.domain.entities.students.Question;
import org.myetutor.platform.domain.entities.tutors.TutorQuestion;
import org.myetutor.platform.domain.repositories.user.UserRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping(value = "/student/register")
@SessionAttributes(value = {User.USER, Question.QUESTION})
public class StudentRegistrationController {

	@Inject
	private UserRepository userRepository;

	@RequestMapping(method = RequestMethod.GET)
	public String viewRegistration(Model model) {
		User userForm = new User();
		model.addAttribute("userForm", userForm);
		return "registration";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String processRegistration(@ModelAttribute("userForm") User user,
			Model model, HttpServletRequest request) {
		try {
			//userRepository.save(user);
			model.addAttribute(User.USER, user);
			model.addAttribute("divWelcomeVisibility", "block");
			model.addAttribute("divNotificationVisibility", "none");
			model.addAttribute("userName", user.getUserName());
			model.addAttribute("userSurname", user.getUserSurname());
			TutorQuestion question = new TutorQuestion();
			question.setQuestionID(1);
			model.addAttribute(TutorQuestion.QUESTION, question);
			return "home";
		} catch(Exception e) {
			// TODO Better checking of duplicate user
			// I.e: if(e instanceof com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException)
			model.addAttribute("errorMessage", "You've already taken the quiz. Thank you");
			model.addAttribute("divNotificationVisibility", "block");
			model.addAttribute("divWelcomeVisibility", "none");
			return "home";
		}
	}
}