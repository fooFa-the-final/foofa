package fofa.service;

import java.util.List;

import fofa.domain.Foodtruck;
import fofa.domain.Menu;

public interface FoodtruckService {
	
	boolean register(Foodtruck foodtruck);
	
	boolean modify(Foodtruck foodtruck);
	
	Foodtruck findById(String sellerId);
	
	List<Foodtruck> findByLoc(String location);
	
	List<Foodtruck> findByKeyLoc(String keyword, String location);
	
	List<Foodtruck> findByFilter(Foodtruck foodtruck);
	
	Foodtruck findBySeller(String sellerId);
	
	List<Menu> registerMenu(Menu menu);
	
	List<Menu> modifyMenu(Menu menu);
	
	List<Menu> removeMenu(String menuId, String foodtruckId);

}








