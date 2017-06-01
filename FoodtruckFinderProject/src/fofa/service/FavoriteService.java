package fofa.service;

import java.util.List;

import fofa.domain.Favorite;

public interface FavoriteService {
	
	boolean register(Favorite favorite);
	
	boolean remove(Favorite favorite);
	
	List<Favorite> findMemberId(String memberId);
	
	int findByFoodtruckId(String foodtruckId);
	
	boolean alreadyFavorite(Favorite favorite);

}
