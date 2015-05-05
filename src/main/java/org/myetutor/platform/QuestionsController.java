package org.myetutor.platform;

import javax.inject.Inject;

import org.myetutor.platform.domain.entities.tutors.Question;
import org.myetutor.platform.domain.entities.tutors.User;
import org.myetutor.platform.domain.entities.tutors.Useranswer;
import org.myetutor.platform.domain.entities.tutors.UseranswerPK;
import org.myetutor.platform.domain.repositories.question.QuestionRepository;
import org.myetutor.platform.domain.repositories.user.answer.UserAnswerRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes(value = { Question.QUESTION, User.USER, "newUserAnswer"})
@RequestMapping(value = "/questions")
public class QuestionsController {

	private static final Logger logger = LoggerFactory
			.getLogger(QuestionsController.class);
	@Inject
	private QuestionRepository questionRepository;
	@Inject
	private UserAnswerRepository userAnswerRepository;

	@RequestMapping(method = RequestMethod.GET)
	public String get(
			@ModelAttribute(value = Question.QUESTION) Question question,
			@ModelAttribute(value = User.USER) User user,
			Model model) {
		Useranswer useranswer = new Useranswer();
		model.addAttribute("newUserAnswer", useranswer);
		Question newQuestion = questionRepository.findByQuestionID(question
				.getQuestionID());
		model.addAttribute("questionID", newQuestion.getQuestionID());
		model.addAttribute("questionText", newQuestion.getQuestionText());
		model.addAttribute("questionExplanation",
				(newQuestion.getQuestionExplanationFlag() ? "block" : "none"));
		return "questions";
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView post(
			@ModelAttribute(value = Question.QUESTION) Question question,
			@ModelAttribute("newUserAnswer") Useranswer useranswer,
			@ModelAttribute(value = User.USER) User user, Model model) {
		useranswer.setId(new UseranswerPK());
		useranswer.setUser(user);
		useranswer.setQuestion(question);
		userAnswerRepository.save(useranswer);
		Question newQuestion = questionRepository.findByQuestionID(question
				.getQuestionID() + 1);
		if (newQuestion == null)
			return new ModelAndView("redirect:done");
		model.addAttribute(Question.QUESTION, newQuestion);
		model.addAttribute(User.USER, user);
		model.addAttribute("newUserAnswer", useranswer);
		return new ModelAndView("redirect:questions");
	}
}
