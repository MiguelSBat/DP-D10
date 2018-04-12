
package controllers;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.ActorService;
import services.ArticleService;
import services.FollowUpService;
import services.NewspaperService;
import services.UserService;
import domain.Actor;
import domain.Article;
import domain.FollowUp;
import domain.Newspaper;
import domain.User;

@Controller
@RequestMapping("/article")
public class ArticleController extends AbstractController {

	// Services ---------------------------------------------------------------

	@Autowired
	private ArticleService		articleService;

	@Autowired
	private UserService			userService;

	@Autowired
	private NewspaperService	newspaperService;

	@Autowired
	private FollowUpService		followUpService;

	@Autowired
	private ActorService		actorService;


	// Constructors -----------------------------------------------------------

	public ArticleController() {
		super();
	}

	// Creation ---------------------------------------------------------------

	// Listing ----------------------------------------------------------------

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(final String keyword) {
		ModelAndView result;
		Collection<Article> articles;

		if (keyword == null)
			articles = this.articleService.findAllPublished();
		else
			articles = this.articleService.findByKeyword(keyword);
		result = new ModelAndView("article/list");
		result.addObject("articles", articles);
		result.addObject("requestURI", "article/list.do");

		return result;
	}

	// display

	@RequestMapping(value = "display", method = RequestMethod.GET)
	public ModelAndView display(@RequestParam final int articleId) {
		final ModelAndView result;
		Article article;
		User user;
		Actor actor;
		Newspaper newspaper;
		boolean privateNewspaper;
		Integer userId;
		Collection<FollowUp> followups;

		userId = null;
		privateNewspaper = false;
		article = this.articleService.findOne(articleId);
		user = this.userService.UserByArticle(articleId);
		followups = this.followUpService.findByArticleId(articleId);
		newspaper = this.newspaperService.findByArticleId(articleId);
		result = new ModelAndView("article/display");
		result.addObject("article", article);
		result.addObject("user", user);
		result.addObject("newspaperId", newspaper.getId());
		result.addObject("followups", followups);
		if (this.actorService.isLogged()) {
			actor = this.actorService.findByPrincipal();
			if (actor instanceof User) {
				user = (User) actor;
				if (newspaper.getPublicity() == false)
					privateNewspaper = true;
				if (user.getNewspapers().contains(newspaper))
					userId = actor.getId();
			}
		}
		result.addObject("privateNewspaper", privateNewspaper);
		result.addObject("userId", userId);
		return result;
	}
	// Edition ----------------------------------------------------------------

}
