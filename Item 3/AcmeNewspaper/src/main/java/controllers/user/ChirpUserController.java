
package controllers.user;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.ActorService;
import services.ChirpService;
import controllers.AbstractController;
import domain.Actor;
import domain.Chirp;

@Controller
@RequestMapping("/user/chirp")
public class ChirpUserController extends AbstractController {

	//Service -----------------------------------------------------------------
	@Autowired
	private ChirpService	chirpService;

	@Autowired
	private ActorService	actorService;


	// Constructors -----------------------------------------------------------

	public ChirpUserController() {
		super();
	}

	// Listing ----------------------------------------------------------------
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Collection<Chirp> chirps;
		Actor principal;

		principal = this.actorService.findByPrincipal();
		chirps = this.chirpService.findByFollowed(principal.getId());
		result = new ModelAndView("user/chirp/list");
		result.addObject("chirps", chirps);

		return result;
	}

	// Creation ---------------------------------------------------------------

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;
		Chirp chirp;

		chirp = this.chirpService.create();
		result = this.createEditModelAndView(chirp);

		return result;
	}
	// Ancillary methods ------------------------------------------------------

	protected ModelAndView createEditModelAndView(final Chirp chirp) {
		ModelAndView result;

		result = this.createEditModelAndView(chirp, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(final Chirp chirp, final String message) {
		ModelAndView result;

		result = new ModelAndView("chirp/edit");
		result.addObject("chirp", chirp);
		result.addObject("message", message);

		return result;
	}
}
