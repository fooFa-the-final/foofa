package fofa.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fofa.domain.Favorite;
import fofa.service.FavoriteService;
import fofa.store.FavoriteStore;

@Service
public class FavoriteServiceLogic implements FavoriteService{
	@Autowired
	private FavoriteStore store;
	
	@Override
	public boolean register(Favorite favorite) {
		return store.insert(favorite) > 0;
	}

	@Override
	public boolean remove(Favorite favorite) {
		return store.delete(favorite) > 0;
	}

	@Override
	public List<Favorite> findMemberId(String memberId) {
		return store.selectByMemberId(memberId);
	}

	@Override
	public int findByFoodtruckId(String foodtruckId) {
		return store.selectByTruckId(foodtruckId);
	}

}
