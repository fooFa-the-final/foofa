package fofa.service.logic;

import java.util.List;

import fofa.domain.Favorite;
import fofa.service.FavoriteService;
import fofa.store.FavoriteStore;
import fofa.store.logic.FavoriteStoreLogic;

public class FavoriteServiceLogic implements FavoriteService{
	private FavoriteStore store;
	
	public FavoriteServiceLogic() {
		store = new FavoriteStoreLogic();
	}

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
