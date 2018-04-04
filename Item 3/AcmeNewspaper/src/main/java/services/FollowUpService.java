
package services;

import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.FollowUpRepository;
import domain.FollowUp;

@Service
@Transactional
public class FollowUpService {

	//Managed Repository ----
	@Autowired
	private FollowUpRepository	followUpRepository;


	//Constructors
	public FollowUpService() {
		super();
	}

	public FollowUp create() {
		FollowUp result;

		result = new FollowUp();

		return result;
	}

	public Collection<FollowUp> findAll() {
		Collection<FollowUp> result;

		result = this.followUpRepository.findAll();

		return result;
	}

	public void delete(final FollowUp followUp) {

		this.followUpRepository.delete(followUp);

	}

	public FollowUp save(final FollowUp followUp) {
		FollowUp result;

		result = this.followUpRepository.save(followUp);
		return result;
	}

	public FollowUp findOne(final int followUpId) {
		FollowUp result;

		result = this.followUpRepository.findOne(followUpId);
		Assert.notNull(result);

		return result;
	}

	public void flush() {
		this.followUpRepository.flush();
	}

}
