package fofa.service.logic;

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
		int regTruck = foodtruckStore.insert(foodtruck);
		List<Menu> menus = foodtruck.getMenus();
		int regMenu = 0;
		
		for(Menu menu : menus){
			regMenu = menuStore.insert(menu);
		}
			
		return regTruck > 0 && regMenu > 0;
	}

	@Override
	public boolean modify(Foodtruck foodtruck) {
		int modTruck = foodtruckStore.update(foodtruck);
		List<Menu> menus = foodtruck.getMenus();
		int modMenu = 0;
		
		for(Menu menu : menus){
			modMenu = menuStore.update(menu);
		}
		
		return modTruck > 0 && modMenu > 0;
	}

	@Override
	public Foodtruck findById(String foodtruckId) {
		return foodtruckStore.selectById(foodtruckId);
	}

	@Override
	public List<Foodtruck> findByLoc(String location) {
		return foodtruckStore.selectByLoc(location);
	}

	@Override
	public List<Foodtruck> findByKeyLoc(String keyword, String location) {
		return foodtruckStore.selectByKeyLoc(keyword, location);
	}

	@Override
	public List<Foodtruck> findByFilter(Foodtruck foodtruck) {
		return foodtruckStore.selectByFilter(foodtruck);
	}

	@Override
	public Foodtruck findBySeller(String sellerId) {
		return foodtruckStore.selectBySellerId(sellerId);
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
