
package services;

import java.util.ArrayList;
import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.NewspaperRepository;
import domain.Article;
import domain.Newspaper;

@Service
@Transactional
public class NewspaperService {

	//Managed Repository ----
	@Autowired
	private NewspaperRepository	newspaperRepository;


	//Constructors
	public NewspaperService() {
		super();
	}

	public Newspaper create() {
		Newspaper result;
		Collection<Article> articles= new ArrayList<>();
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

		this.newspaperRepository.delete(newspaper);

	}

	public Newspaper save(final Newspaper newspaper) {
		Newspaper result;

		result = this.newspaperRepository.save(newspaper);
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

}
