package fofa.service.logic;

import java.sql.Date;
import java.util.List;

import fofa.domain.Sale;
import fofa.service.SalesService;

public class SalesServiceLogic implements SalesService{

	@Override
	public void register(Sale sale) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modify(Sale sale) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(String saleId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Sale findDateSale(Date date, String foodtruckId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Sale> find1YearSales(String foodtruckId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Sale> find10DaysSales(String foodtruckId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Sale> find1MonthSales(String foodtruckId, String month) {
		// TODO Auto-generated method stub
		return null;
	}

}
