package fofa.store;

import java.util.List;

import fofa.domain.Favorite;

public interface FavoriteStore {
	
	int insert(Favorite favorite);
	
	int delete(Favorite favorite);
	
	List<Favorite> selectByMemberId(String memberId);
	
	int selectByTruckId(String foodtruckId);

	int select(Favorite favorite);

	int selectCount(String foodtruckId);
}
