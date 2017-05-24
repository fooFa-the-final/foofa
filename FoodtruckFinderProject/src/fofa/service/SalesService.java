package fofa.service;

import java.sql.Date;
import java.util.List;

import fofa.domain.Sale;

public interface SalesService {
	
	void register(Sale sale);
	void modify(Sale sale);
	void remove(String saleId);
	Sale findDateSale(Date date, String foodtruckId);
	List<Sale> find1YearSales(String foodtruckId);
	List<Sale> find10DaysSales(String foodtruckId);
	List<Sale> find1MonthSales(String foodtruckId,String month);
	

}
