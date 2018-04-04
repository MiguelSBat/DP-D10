
package services;

import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.ChirpRepository;
import domain.Chirp;

@Service
@Transactional
public class ChirpService {

	//Managed Repository ----
	@Autowired
	private ChirpRepository	chirpRepository;


	//Constructors
	public ChirpService() {
		super();
	}

	public Chirp create() {
		Chirp result;

		result = new Chirp();

		return result;
	}

	public Collection<Chirp> findAll() {
		Collection<Chirp> result;

		result = this.chirpRepository.findAll();

		return result;
	}

	public void delete(final Chirp chirp) {

		this.chirpRepository.delete(chirp);

	}

	public Chirp save(final Chirp chirp) {
		Chirp result;

		result = this.chirpRepository.save(chirp);
		return result;
	}

	public Chirp findOne(final int chirpId) {
		Chirp result;

		result = this.chirpRepository.findOne(chirpId);
		Assert.notNull(result);

		return result;
	}

	public void flush() {
		this.chirpRepository.flush();
	}

}
