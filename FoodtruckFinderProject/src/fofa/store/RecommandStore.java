package fofa.store;

import java.util.List;

import fofa.domain.Recommand;

public interface RecommandStore {
	int insert(Recommand recommand);
	int delete(Recommand recommand);
	List<Recommand> selectAll(String reviewId);
}
