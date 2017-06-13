package fofa.store.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import fofa.domain.Foodtruck;

public interface FoodtruckMapper {
	
	int insert(Foodtruck foodtruck);
	
	int update(Foodtruck foodtruck);
	
	Foodtruck selectById(String foodtruckId);
	
	List<HashMap<String, Object>> selectByLoc(Map<String, Object> map);
	
	List<HashMap<String, Object>> selectByKeyLoc(Map<String, Object> map);
	
	List<HashMap<String, Object>> selectByFilter(Map<String, Object> map);
	
	Foodtruck selectBySellerId(String sellerId);
	

}
