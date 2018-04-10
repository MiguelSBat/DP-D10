
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Article;
import domain.Newspaper;

@Repository
public interface NewspaperRepository extends JpaRepository<Newspaper, Integer> {

	@Query("select n from Newspaper n where n.title like CONCAT('%',?1,'%') or n.description like CONCAT('%',?1,'%')")
	Collection<Newspaper> findByCriteria(String criteria);

	@Query("select n from Newspaper n join n.articles a where a.id=?1")
	Newspaper findByArticleId(int id);

	@Query("select n from Newspaper n where n.taboo=1")
	Collection<Newspaper> findTaboo();
}
