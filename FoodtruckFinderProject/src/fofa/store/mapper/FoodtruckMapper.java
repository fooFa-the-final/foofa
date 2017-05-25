package fofa.store.mapper;

import java.util.List;

import fofa.domain.Foodtruck;

public interface FoodtruckMapper {
	
int insert(Foodtruck foodtruck);
	
	int update(Foodtruck foodtruck);
	
	Foodtruck selectById(String foodtruckId);
	
	List<Foodtruck> selectByLoc(String location);
	
	List<Foodtruck> selectByKeyLoc(String keyword, String location);
	
	List<Foodtruck> selectByFilter(Foodtruck foodtruck);
	
	Foodtruck selectBySellerId(String sellerId);
	

}
