
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

	@Query("select u from User u join u.users f where f.id=?1")
	Collection<User> findFollowingMe(int id);

	@Query("select u from User u where (select a from Article a where a.id = ?1) member of u.articles")
	User UserByArticle(int articleId);

}
