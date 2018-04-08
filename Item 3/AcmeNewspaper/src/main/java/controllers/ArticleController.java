
package controllers;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.ArticleService;
import services.UserService;
import domain.Article;
import domain.User;

@Controller
@RequestMapping("/article")
public class ArticleController extends AbstractController {

	// Services ---------------------------------------------------------------

	@Autowired
	private ArticleService	articleService;
	@Autowired
	private UserService		userService;


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
			articles = this.articleService.findAll();
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

		article = this.articleService.findOne(articleId);
		user = this.userService.UserByArticle(articleId);
		result = new ModelAndView("article/display");
		result.addObject("article", article);
		result.addObject("user", user);

		return result;
	}
	// Edition ----------------------------------------------------------------

}
