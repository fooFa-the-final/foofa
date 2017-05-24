package fofa.store.logic;

import java.sql.Date;
import java.util.List;

import fofa.domain.Sale;
import fofa.store.SalesStore;

public class SalesStoreLogic implements SalesStore{

	@Override
	public void insert(Sale sale) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Sale sale) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(String saleId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Sale selectDaySale(Date date, String foodtruckId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Sale> select1MonthSales(String foodtruckId, String month) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Sale> select1YearSales(String foodtruckId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Sale> select10DaysSales(String foodtruckId) {
		// TODO Auto-generated method stub
		return null;
	}

}
