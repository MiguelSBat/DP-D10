
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
		User user, objective;

		actor = this.actorService.findByPrincipal();
		Assert.notNull(actor);

		user = (User) actor;
		objective = this.findOne(userId);
		if (!user.getUsers().contains(objective))
			user.getUsers().add(objective);
	}

	public void unfollow(final int userId) {
		Actor actor;
		User user, objective;
		Collection<User> following;

		actor = this.actorService.findByPrincipal();
		Assert.notNull(actor);
		user = (User) actor;

		following = user.getUsers();
		objective = this.findOne(userId);
		following.remove(objective);

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
	public User findByArticleId(final int articleId) {
		User result;

		result = this.userRepository.findByArticleId(articleId);

		return result;
	}
	public User findByNewspaperId(final int newspaperId) {
		User result;

		result = this.userRepository.findByNewspaperId(newspaperId);

		return result;
	}
}
