package fofa.service.logic;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fofa.domain.Foodtruck;
import fofa.domain.Menu;
import fofa.service.FoodtruckService;
import fofa.store.FoodtruckStore;
import fofa.store.MenuStore;

@Service
public class FoodtruckServiceLogic implements FoodtruckService{
	@Autowired
	private FoodtruckStore foodtruckStore;
	@Autowired
	private MenuStore menuStore;
	
	@Override
	public boolean register(Foodtruck foodtruck) {
		String foodtruckId = foodtruckStore.insert(foodtruck);
		List<Menu> menus = foodtruck.getMenus();
		int regMenu = 0;
		if(menus!=null){
			for(Menu menu : menus){
				menu.setFoodtruckId(foodtruckId);
				regMenu = menuStore.insert(menu);
			}
		}
		return regMenu > 0;
	}

	@Override
	public boolean modify(Foodtruck foodtruck) {
		int modTruck = foodtruckStore.update(foodtruck);
		List<Menu> menus = foodtruck.getMenus();
		int modMenu = menuStore.update(menus);
		return modTruck > 0 && modMenu > 0;
	}

	@Override
	public Foodtruck findById(String foodtruckId) {
		Foodtruck foodtruck = foodtruckStore.selectById(foodtruckId);
		String[] category = foodtruck.getCategory1().split("/");
		foodtruck.setCategory1(category[0]);
			if(category.length >= 2){
				foodtruck.setCategory2(category[1]);
			}
			if(category.length >= 3){
				foodtruck.setCategory2(category[1]);
				foodtruck.setCategory3(category[2]);
			}
		return foodtruck;
	}

	@Override
	public List<HashMap<String, Object>> findByLoc(int pageNum, String location) {
		return foodtruckStore.selectByLoc(pageNum, location);
	}

	@Override
	public List<HashMap<String, Object>> findByKeyLoc(int pageNum, String keyword, String location) {
		return foodtruckStore.selectByKeyLoc(pageNum, keyword, location);
	}

	@Override
	public List<HashMap<String, Object>> findByFilter(int pageNum, Foodtruck foodtruck, String sort) {
		return foodtruckStore.selectByFilter(pageNum, foodtruck, sort);
	}

	@Override
	public Foodtruck findBySeller(String sellerId) {
		Foodtruck foodtruck = foodtruckStore.selectBySellerId(sellerId);
		String[] category = foodtruck.getCategory1().split("/");
		foodtruck.setCategory1(category[0]);
			if(category.length >= 2){
				foodtruck.setCategory2(category[1]);
			}
			if(category.length >= 3){
				foodtruck.setCategory2(category[1]);
				foodtruck.setCategory3(category[2]);
			}
		return foodtruck;
	}

	@Override
	public List<Menu> registerMenu(Menu menu) {
		int regMenu = menuStore.insert(menu);
		if(regMenu > 0){
			return menuStore.selectByTruckId(menu.getFoodtruckId());
		}
		return null;
	}

	@Override
	public List<Menu> modifyMenu(Menu menu) {
		int modMenu = menuStore.update(menu);
		if(modMenu > 0){
			return menuStore.selectByTruckId(menu.getFoodtruckId());
		}
		return null;
	}

	@Override
	public List<Menu> removeMenu(String menuId, String foodtruckId) {
		int remMenu = menuStore.delete(menuId, foodtruckId);
		if(remMenu > 0){
			return menuStore.selectByTruckId(foodtruckId);
		}
		return null;
	}
	

}
