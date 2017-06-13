package fofa.store;

import java.util.HashMap;
import java.util.List;

import fofa.domain.Foodtruck;

public interface FoodtruckStore {
	
	String insert(Foodtruck foodtruck);
	
	int update(Foodtruck foodtruck);
	
	Foodtruck selectById(String foodtruckId);
	
	List<HashMap<String, Object>> selectByLoc(int pageNum, String location);
	
	List<HashMap<String, Object>> selectByKeyLoc(int pageNum, String keyword, String location);
	
	List<HashMap<String, Object>> selectByFilter(int pageNum, Foodtruck foodtruck, String sort);
	
	Foodtruck selectBySellerId(String sellerId);

}
