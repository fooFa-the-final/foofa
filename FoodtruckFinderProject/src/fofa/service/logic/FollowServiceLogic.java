package fofa.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fofa.domain.Follow;
import fofa.service.FollowService;
import fofa.store.FollowStore;

@Service
public class FollowServiceLogic implements FollowService{

	@Autowired
	private FollowStore store;
	
	@Override
	public boolean register(Follow follow) {
	
		return store.insert(follow) >0;
	}

	@Override
	public boolean remove(Follow follow) {
		return store.delete(follow)>0;
	}

	@Override
	public List<Follow> findFollow(String toId) {
		return store.selectByToId(toId);
	}

	@Override
	public int findFollowsCount(String toId) {
		return findFollowsCount(toId);
	}

}
