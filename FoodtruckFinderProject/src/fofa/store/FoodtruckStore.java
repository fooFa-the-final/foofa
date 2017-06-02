package fofa.store;

import java.util.HashMap;
import java.util.List;

import fofa.domain.Foodtruck;

public interface FoodtruckStore {
	
	String insert(Foodtruck foodtruck);
	
	int update(Foodtruck foodtruck);
	
	Foodtruck selectById(String foodtruckId);
	
	List<HashMap<String, String>> selectByLoc(int pageNum, String location);
	
	List<HashMap<String, String>> selectByKeyLoc(int pageNum, String keyword, String location);
	
	List<Foodtruck> selectByFilter(int pageNum, Foodtruck foodtruck);
	
	Foodtruck selectBySellerId(String sellerId);

}
