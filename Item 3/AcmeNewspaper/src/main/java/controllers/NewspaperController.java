
package controllers;

import java.util.Collection;
import java.util.TreeMap;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.NewspaperService;
import services.UserService;
import domain.Article;
import domain.Newspaper;
import domain.User;

@Controller
@RequestMapping("/newspaper")
public class NewspaperController extends AbstractController {

	// Services ---------------------------------------------------------------

	@Autowired
	private NewspaperService	newspaperService;
	@Autowired
	private UserService			userService;


	// Constructors -----------------------------------------------------------

	public NewspaperController() {
		super();
	}

	// Creation ---------------------------------------------------------------

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;
		Newspaper newspaper;

		newspaper = this.newspaperService.create();
		result = this.createEditModelAndView(newspaper);

		return result;
	}

	// Listing ----------------------------------------------------------------

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(final String criteria) {
		ModelAndView result;
		Collection<Newspaper> newspapers;

		newspapers = this.newspaperService.findByCriteria(criteria);
		if (criteria == null)
			newspapers = this.newspaperService.findAll();
		result = new ModelAndView("newspaper/list");
		result.addObject("newspapers", newspapers);

		return result;
	}

	// display

	@RequestMapping(value = "display", method = RequestMethod.GET)
	public ModelAndView display(@RequestParam final int newspaperId) {
		final ModelAndView result;
		final Newspaper newspaper;
		User u;
		newspaper = this.newspaperService.findOne(newspaperId);
		final Collection<Article> articles = newspaper.getArticles();
		final TreeMap<Integer, User> mapaMegaComplejo = new TreeMap<>();
		
		for (final Article a : articles) {
			u = this.userService.UserByArticle(a.getId());
		
			mapaMegaComplejo.put(a.getId(), u);
		}
		result = new ModelAndView("newspaper/display");
		result.addObject("newspaper", newspaper);
		result.addObject("mapaMegaComplejo", mapaMegaComplejo);

		return result;
	}
	// Edition ----------------------------------------------------------------

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam final int newspaperId) {
		ModelAndView result;
		Newspaper newspaper;

		newspaper = this.newspaperService.findOne(newspaperId);

		result = this.createEditModelAndView(newspaper);

		return result;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final Newspaper newspaper, final BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors())
			result = this.createEditModelAndView(newspaper);
		else
			try {
				this.newspaperService.save(newspaper);
				result = new ModelAndView("redirect:list.do");
			} catch (final Throwable oops) {
				String errorMessage = "category.commit.error";

				if (oops.getMessage().contains("message.error"))
					errorMessage = oops.getMessage();
				result = this.createEditModelAndView(newspaper, errorMessage);
			}

		return result;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "delete")
	public ModelAndView delete(final Newspaper newspaper, final BindingResult binding) {
		ModelAndView result;

		try {
			this.newspaperService.delete(newspaper);
			result = new ModelAndView("redirect:list.do");
		} catch (final Throwable oops) {
			String errorMessage = "category.commit.error";

			if (oops.getMessage().contains("message.error"))
				errorMessage = oops.getMessage();
			result = this.createEditModelAndView(newspaper, errorMessage);
		}
		return result;
	}

	// Ancillary methods ------------------------------------------------------

	protected ModelAndView createEditModelAndView(final Newspaper newspaper) {
		ModelAndView result;

		result = this.createEditModelAndView(newspaper, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(final Newspaper newspaper, final String message) {
		ModelAndView result;

		result = new ModelAndView("newspaper/edit");
		result.addObject("newspaper", newspaper);
		result.addObject("message", message);

		return result;
	}
}
