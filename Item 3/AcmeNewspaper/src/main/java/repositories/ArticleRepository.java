
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Article;

@Repository
public interface ArticleRepository extends JpaRepository<Article, Integer> {

	@Query("select a from Article a where a.title like CONCAT('%',?1,'%') or a.summary like CONCAT('%',?1,'%') or a.text like CONCAT('%',?1,'%')")
	Collection<Article> findByKeyword(String keyword);
}
