package fofa.store.mapper;

import java.util.List;

import fofa.domain.Recommand;

public interface RecommandMapper {
	int insert(Recommand recommand);
	int delete(Recommand recommand);
	List<Recommand> selectAll();
}
