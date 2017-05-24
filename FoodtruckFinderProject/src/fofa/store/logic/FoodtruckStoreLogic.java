package fofa.store.logic;

import java.util.List;

import fofa.domain.Foodtruck;
import fofa.store.FoodtruckStore;

public class FoodtruckStoreLogic implements FoodtruckStore{

	@Override
	public int insert(Foodtruck foodtruck) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Foodtruck foodtruck) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Foodtruck selectById(String foodtruckId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Foodtruck> selectByLoc(String location) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Foodtruck> selectByKeyLoc(String keyword, String location) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Foodtruck> selectByFilter(Foodtruck foodtruck) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Foodtruck selectBySellerId(String sellerId) {
		// TODO Auto-generated method stub
		return null;
	}

}
