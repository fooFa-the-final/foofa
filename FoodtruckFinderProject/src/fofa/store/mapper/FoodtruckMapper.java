package fofa.store.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import fofa.domain.Foodtruck;

public interface FoodtruckMapper {
	
	int insert(Foodtruck foodtruck);
	
	int update(Foodtruck foodtruck);
	
	Foodtruck selectById(String foodtruckId);
	
	List<HashMap<String, String>> selectByLoc(Map<String, Object> map);
	
	List<HashMap<String, String>> selectByKeyLoc(Map<String, Object> map);
	
	List<HashMap<String, String>> selectByFilter(Map<String, Object> map);
	
	Foodtruck selectBySellerId(String sellerId);
	

}
