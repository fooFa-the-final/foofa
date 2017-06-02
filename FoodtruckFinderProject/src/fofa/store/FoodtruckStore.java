package fofa.store;

import java.util.List;

import fofa.domain.Foodtruck;

public interface FoodtruckStore {
	
	String insert(Foodtruck foodtruck);
	
	int update(Foodtruck foodtruck);
	
	Foodtruck selectById(String foodtruckId);
	
	List<Foodtruck> selectByLoc(int pageNum, String location);
	
	List<Foodtruck> selectByKeyLoc(int pageNum, String keyword, String location);
	
	List<Foodtruck> selectByFilter(int pageNum, Foodtruck foodtruck);
	
	Foodtruck selectBySellerId(String sellerId);

}
