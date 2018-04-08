/*
 * WelcomeController.java
 * 
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the
 * TDG Licence, a copy of which you may download from
 * http://www.tdg-seville.info/License.html
 */

package controllers;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.UserService;
import domain.User;

@Controller
@RequestMapping("/user")
public class UserController extends AbstractController {

	// Services ---------------------------------------------------------------

	@Autowired
	private UserService	userService;


	// Constructors -----------------------------------------------------------

	public UserController() {
		super();
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() throws Exception {
		final ModelAndView result;
		final Collection<User> users;

		users = this.userService.findAll();

		result = new ModelAndView("actor/list");
		result.addObject("actors", users);
		result.addObject("actorType", "user");
		result.addObject("requestURI", "user/list.do");
		return result;
	}

	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ModelAndView display(@RequestParam final int userId) throws Exception {
		final ModelAndView result;
		User user;

		user = this.userService.findOne(userId);

		result = new ModelAndView("actor/display");
		result.addObject("user", user);
		result.addObject("articles", user.getArticles());
		result.addObject("requestURI", "user/display.do?userId=" + userId);
		return result;
	}

}
