package fofa.store.mapper;

import java.util.List;

import fofa.domain.Follow;

public interface FollowMapper {

	int insert(Follow follow);
	int delete(Follow follow);
	List<Follow> selectByFromId(String fromId);
	List<Follow> selectByToId(String toId);
	
}
