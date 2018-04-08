
package services;

import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.UserRepository;
import domain.Actor;
import domain.User;

@Service
@Transactional
public class UserService {

	//Managed Repository ----
	@Autowired
	private UserRepository	userRepository;

	//Supporting Services ---

	@Autowired
	private ActorService	actorService;


	//Constructors
	public UserService() {
		super();
	}

	public User create() {
		User result;

		result = new User();

		return result;
	}

	public Collection<User> findAll() {
		Collection<User> result;

		result = this.userRepository.findAll();

		return result;
	}

	public void delete(final User user) {

		this.userRepository.delete(user);

	}

	public User save(final User user) {
		User result;

		result = this.userRepository.save(user);
		return result;
	}

	public User findOne(final int userId) {
		User result;

		result = this.userRepository.findOne(userId);
		Assert.notNull(result);

		return result;
	}

	public Collection<User> findFollowingMe(final int userId) {
		Collection<User> result;

		result = this.userRepository.findFollowingMe(userId);

		return result;

	}

	public void follow(final int userId) {
		Actor actor;
		User user;
		actor = this.actorService.findByPrincipal();
		Assert.notNull(actor);
		user = (User) actor;
		user.getUsers().add(this.findOne(userId));
	}

	public void unfollow(final int userId) {
		Actor actor;
		User user;
		actor = this.actorService.findByPrincipal();
		Assert.notNull(actor);
		user = (User) actor;
		final Collection<User> following = this.findFollowingMe(user.getId());
		following.remove(this.findOne(userId));

	}

	public void flush() {
		this.userRepository.flush();
	}
	public User UserByArticle(final int articleId) {
		User result;

		result = this.userRepository.UserByArticle(articleId);
		Assert.notNull(result);
		return result;
	}
	public User findByChirpId(final int chirpId) {
		User result;

		result = this.userRepository.findByChirpId(chirpId);

		return result;
	}
}
