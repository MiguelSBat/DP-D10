
package services;

import java.util.ArrayList;
import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.NewspaperRepository;
import domain.Actor;
import domain.Administrator;
import domain.Article;
import domain.Newspaper;
import domain.User;

@Service
@Transactional
public class NewspaperService {

	//Managed Repository ----
	@Autowired
	private NewspaperRepository	newspaperRepository;
	@Autowired
	private ActorService		actorService;
	@Autowired
	private UserService			userService;

	@Autowired
	private ArticleService		articleService;


	//Constructors
	public NewspaperService() {
		super();
	}

	public Newspaper create() {
		Newspaper result;
		final Collection<Article> articles = new ArrayList<>();

		result = new Newspaper();
		result.setArticles(articles);
		return result;
	}

	public Collection<Newspaper> findAll() {
		Collection<Newspaper> result;

		result = this.newspaperRepository.findAll();

		return result;
	}

	public void delete(final Newspaper newspaper) {
		Actor principal;
		User user;
		Collection<Newspaper> newspapers;

		principal = this.actorService.findByPrincipal();
		Assert.isTrue(principal instanceof Administrator);
		user = this.userService.findByNewspaperId(newspaper.getId());
		newspapers = user.getNewspapers();
		newspapers.remove(newspaper);
		user.setNewspapers(newspapers);
		this.userService.save(user);
		for (final Article a : newspaper.getArticles())
			this.articleService.deleteByNewspaper(a);
		this.newspaperRepository.delete(newspaper);

	}
	public Newspaper save(final Newspaper newspaper) {
		Newspaper result;

		if (newspaper.getId() != 0)
			result = this.newspaperRepository.save(newspaper);
		else {
			result = this.newspaperRepository.save(newspaper);
			final User u = (User) this.actorService.findByPrincipal();
			final Collection<Newspaper> newspapers = u.getNewspapers();
			newspapers.add(result);
			u.setNewspapers(newspapers);
			this.userService.save(u);
		}
		return result;
	}

	public Newspaper findOne(final int newspaperId) {
		Newspaper result;

		result = this.newspaperRepository.findOne(newspaperId);
		Assert.notNull(result);

		return result;
	}

	public void flush() {
		this.newspaperRepository.flush();
	}
	public Collection<Newspaper> findByCriteria(final String criteria) {
		final Collection<Newspaper> newspapers;
		newspapers = this.newspaperRepository.findByCriteria(criteria);
		return newspapers;
	}
	public Newspaper findByArticleId(final int id) {
		Newspaper result;

		result = this.newspaperRepository.findByArticleId(id);

		return result;
	}
}
