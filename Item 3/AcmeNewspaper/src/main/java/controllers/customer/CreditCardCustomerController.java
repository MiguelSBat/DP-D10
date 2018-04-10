
package controllers.customer;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.ActorService;
import services.CreditCardService;
import controllers.AbstractController;
import domain.CreditCard;

@Controller
@RequestMapping("/creditcard/customer")
public class CreditCardCustomerController extends AbstractController {

	//Services

	@Autowired
	private CreditCardService	creditCardService;

	@Autowired
	private ActorService		actorService;


	//Constructor

	public CreditCardCustomerController() {
		super();
	}

	//Create

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create(@RequestParam final int sponsorshipId) {
		ModelAndView result;
		CreditCard creditcard;

		creditcard = this.creditCardService.create();
		result = this.createEditModelAndView(creditcard);
		return result;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final CreditCard creditcard, final BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors())
			result = this.createEditModelAndView(creditcard);
		else
			try {
				this.creditCardService.save(creditcard);
				result = new ModelAndView("redirect:/newspaper/list.do");
			} catch (final Throwable oops) {
				result = this.createEditModelAndView(creditcard, "creditcard.commit.error");
			}

		return result;
	}

	//Ancillary methods

	private ModelAndView createEditModelAndView(final CreditCard creditcard) {
		ModelAndView result;

		result = this.createEditModelAndView(creditcard, null);

		return result;
	}

	private ModelAndView createEditModelAndView(final CreditCard creditcard, final String messageCode) {
		ModelAndView result;

		result = new ModelAndView("creditCard/edit");
		result.addObject("creditcard", creditcard);
		result.addObject("message", messageCode);

		return result;
	}
}
