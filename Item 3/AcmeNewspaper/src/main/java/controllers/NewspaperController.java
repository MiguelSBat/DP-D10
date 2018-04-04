

package controllers;

import java.util.Collection;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import domain.Newspaper;

import services.NewspaperService;

@Controller
@RequestMapping("/newspaper")
public class NewspaperController extends AbstractController {

	// Services ---------------------------------------------------------------

	@Autowired
	private NewspaperService newspaperService;

	// Constructors -----------------------------------------------------------

	public NewspaperController() {
		super();
	}
	
	// Creation ---------------------------------------------------------------

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;
		Newspaper newspaper;

		newspaper = newspaperService.create();
		result = createEditModelAndView(newspaper);
		
		return result;
	}

	// Listing ----------------------------------------------------------------

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView display() {
		ModelAndView result;
		Collection<Newspaper> newspapers;

		newspapers = newspaperService.findAll();

		result = new ModelAndView("newspaper/list");
		result.addObject("newspapers", newspapers);

		return result;
	}

	// Edition ----------------------------------------------------------------

//	@RequestMapping(value = "/edit", method = RequestMethod.GET)
//	public ModelAndView edit(@RequestParam final int newspaperId) {
//		ModelAndView result;
//		Newspaper newspaper;
//
//		newspaper = newspaperService.findOne(newspaperId);
//		Assert.isTrue(newspaper.getSavedMode().equals("DRAFT MODE"));
//
//		result = this.createEditModelAndView(newspaper);
//
//		return result;
//	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final Newspaper newspaper,
			final BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors())
			result = this.createEditModelAndView(newspaper);
		else
			try {
				this.newspaperService.save(newspaper);
				result = new ModelAndView("redirect:list.do");
			} catch (final Throwable oops) {
				String errorMessage = "category.commit.error";
				
				if(oops.getMessage().contains("message.error")){
					errorMessage = oops.getMessage();
				}
				result = this.createEditModelAndView(newspaper, errorMessage);
			}

		return result;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "delete")
	public ModelAndView delete(final Newspaper newspaper,
			final BindingResult binding) {
		ModelAndView result;

		try {
			this.newspaperService.delete(newspaper);
			result = new ModelAndView("redirect:list.do");
		} catch (final Throwable oops) {
			String errorMessage = "category.commit.error";
			
			if(oops.getMessage().contains("message.error")){
				errorMessage = oops.getMessage();
			}
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

	protected ModelAndView createEditModelAndView(final Newspaper newspaper,
			final String message) {
		ModelAndView result;

		result = new ModelAndView("newspaper/edit");
		result.addObject("newspaper", newspaper);
		result.addObject("message", message);

		return result;
	}
}
