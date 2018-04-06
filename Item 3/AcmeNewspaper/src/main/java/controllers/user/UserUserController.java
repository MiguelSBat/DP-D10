
package controllers.user;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.ActorService;
import services.UserService;
import controllers.AbstractController;
import domain.Actor;
import domain.User;

@Controller
@RequestMapping("/user/user")
public class UserUserController extends AbstractController {

	//Service -----------------------------------------------------------------

	@Autowired
	private UserService		userService;

	@Autowired
	private ActorService	actorService;


	// Constructors -----------------------------------------------------------

	public UserUserController() {
		super();
	}

	// Listing ----------------------------------------------------------------

	@RequestMapping(value = "/followers", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Collection<User> followers;
		Actor principal;
		User user;

		principal = this.actorService.findByPrincipal();
		user = (User) principal;
		followers = this.userService.findFollowingMe(user.getId());
		result = new ModelAndView("user/followers");
		result.addObject("users", followers);
		result.addObject("requestURI", "user/user/list.do");
		return result;
	}

	@RequestMapping(value = "/following", method = RequestMethod.GET)
	public ModelAndView list2() {
		ModelAndView result;
		Collection<User> following;
		Actor principal;
		User user;

		principal = this.actorService.findByPrincipal();
		user = (User) principal;
		following = user.getUsers();
		result = new ModelAndView("user/following");
		result.addObject("users", following);
		result.addObject("requestURI", "user/user/list.do");
		return result;
	}
}
