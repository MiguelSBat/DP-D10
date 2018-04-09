
package controllers.administrator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.ActorService;
import services.ArticleService;
import controllers.AbstractController;
import domain.Article;

@Controller
@RequestMapping("/administrator/article")
public class ArticleAdministratorController extends AbstractController {

	//Service -----------------------------------------------------------------
	@Autowired
	private ArticleService	articleService;

	@Autowired
	private ActorService	actorService;


	// Constructors -----------------------------------------------------------

	public ArticleAdministratorController() {
		super();
	}

	// Listing ----------------------------------------------------------------

	// Delete ---------------------------------------------------------------
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView delete(final int articleId) {
		ModelAndView result;
		Article article;

		article = this.articleService.findOne(articleId);
		this.articleService.delete(article);
		result = new ModelAndView("redirect:/administrator/article/list.do");

		return result;
	}

}
