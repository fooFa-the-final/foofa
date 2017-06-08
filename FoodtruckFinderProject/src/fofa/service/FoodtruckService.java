package fofa.service;

import java.util.HashMap;
import java.util.List;

import fofa.domain.Foodtruck;
import fofa.domain.Menu;

public interface FoodtruckService {
	
	boolean register(Foodtruck foodtruck);
	
	boolean modify(Foodtruck foodtruck);
	
	Foodtruck findById(String foodtruckId);
	
	List<HashMap<String, String>> findByLoc(int pageNum, String location);
	
	List<HashMap<String, String>> findByKeyLoc(int pageNum, String keyword, String location);
	
	List<HashMap<String, String>> findByFilter(int pageNum, Foodtruck foodtruck, String sort);
	
	Foodtruck findBySeller(String sellerId);
	
	List<Menu> registerMenu(Menu menu);
	
	List<Menu> modifyMenu(Menu menu);
	
	List<Menu> removeMenu(String menuId, String foodtruckId);

}








