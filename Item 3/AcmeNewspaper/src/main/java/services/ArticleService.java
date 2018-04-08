
package services;

import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.ArticleRepository;
import domain.Actor;
import domain.Administrator;
import domain.Article;

@Service
@Transactional
public class ArticleService {

	//Managed Repository ----
	@Autowired
	private ArticleRepository	articleRepository;

	@Autowired
	private ActorService		actorService;


	//Constructors
	public ArticleService() {
		super();
	}

	public Article create() {
		Article result;

		result = new Article();

		return result;
	}

	public Collection<Article> findAll() {
		Collection<Article> result;

		result = this.articleRepository.findAll();

		return result;
	}

	public Collection<Article> findAllPublishedByUser(final int userId) {
		Collection<Article> result;

		result = this.articleRepository.findAllPublishedByUser(userId);

		return result;
	}
	public void delete(final Article article) {
		Actor principal;

		principal = this.actorService.findByPrincipal();
		Assert.isTrue(principal instanceof Administrator);
		this.articleRepository.delete(article);

	}
	public Article save(final Article article) {
		Article result;

		result = this.articleRepository.save(article);
		return result;
	}

	public Article findOne(final int articleId) {
		Article result;

		result = this.articleRepository.findOne(articleId);
		Assert.notNull(result);

		return result;
	}

	public void flush() {
		this.articleRepository.flush();
	}

	public Collection<Article> findByKeyword(final String keyword) {
		Collection<Article> result;

		result = this.articleRepository.findByKeyword(keyword);

		return result;
	}
}
