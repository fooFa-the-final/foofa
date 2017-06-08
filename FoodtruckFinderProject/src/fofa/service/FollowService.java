package fofa.service;

import java.util.List;

import fofa.domain.Follow;

public interface FollowService {

	boolean register(Follow follow);
	boolean remove(Follow follow);
	List<Follow> findFollow(String toId);
	int findFollowsCount(String toId);
	boolean alreadyFollow(Follow follow);
	
}
