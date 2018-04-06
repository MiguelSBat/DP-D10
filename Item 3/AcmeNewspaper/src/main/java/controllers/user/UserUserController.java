
package controllers.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import services.UserService;
import controllers.AbstractController;

@Controller
@RequestMapping("/user/user")
public class UserUserController extends AbstractController {

	//Service -----------------------------------------------------------------

	@Autowired
	private UserService	userService;


	// Constructors -----------------------------------------------------------

	public UserUserController() {
		super();
	}

	// 
}
