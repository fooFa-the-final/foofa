package fofa.service.logic;

import java.util.List;

import fofa.domain.Foodtruck;
import fofa.domain.Menu;
import fofa.service.FoodtruckService;

public class FoodtruckServiceLogic implements FoodtruckService{

	@Override
	public boolean register(Foodtruck foodtruck) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean modify(Foodtruck foodtruck) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Foodtruck findById(String foodtruckId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Foodtruck> findByLoc(String location) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Foodtruck> findByKeyLoc(String keyword, String location) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Foodtruck> findByFilter(Foodtruck foodtruck) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Foodtruck findBySeller(String sellerId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Menu> registerMenu(Menu menu) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Menu> modifyMenu(Menu menu) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Menu> removeMenu(String menuId) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
