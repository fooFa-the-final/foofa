package fofa.store;

import java.util.List;

import fofa.domain.Follow;

public interface FollowStore {

	int insert(Follow follow);
	int delete(Follow follow);
	List<Follow> selectByFromId(String fromId);
	int selectByToId(String toId);
	
}
