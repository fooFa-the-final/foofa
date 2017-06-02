package fofa.store.mapper;

import java.util.List;
import java.util.Map;

import fofa.domain.Foodtruck;

public interface FoodtruckMapper {
	
	int insert(Foodtruck foodtruck);
	
	int update(Foodtruck foodtruck);
	
	Foodtruck selectById(String foodtruckId);
	
	List<Foodtruck> selectByLoc(Map<String, Object> map);
	
	List<Foodtruck> selectByKeyLoc(Map<String, Object> map);
	
	List<Foodtruck> selectByFilter(Map<String, Object> map);
	
	Foodtruck selectBySellerId(String sellerId);
	

}
