package fofa.store;

import fofa.domain.Recommand;

public interface RecommandStore {
	int insert(Recommand recommand);
	int delete(Recommand recommand);
}
