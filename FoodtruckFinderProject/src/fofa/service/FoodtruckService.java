package fofa.service;

import java.util.List;

import fofa.domain.Foodtruck;
import fofa.domain.Menu;

public interface FoodtruckService {
	
	boolean register(Foodtruck foodtruck);
	
	boolean modify(Foodtruck foodtruck);
	
	Foodtruck findById(String foodtruckId);
	
	List<Foodtruck> findByLoc(int pageNum, String location);
	
	List<Foodtruck> findByKeyLoc(int pageNum, String keyword, String location);
	
	List<Foodtruck> findByFilter(int pageNum, Foodtruck foodtruck);
	
	Foodtruck findBySeller(String sellerId);
	
	List<Menu> registerMenu(Menu menu);
	
	List<Menu> modifyMenu(Menu menu);
	
	List<Menu> removeMenu(String menuId, String foodtruckId);

}








