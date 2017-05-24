package fofa.store;

import java.sql.Date;
import java.util.List;

import fofa.domain.Sale;

public interface SalesStore {

	void insert(Sale sale);
	void update(Sale sale);
	void delete(String saleId);
	Sale selectDaySale(Date date, String foodtruckId);
	List<Sale> select1MonthSales(String foodtruckId, String month);
	List<Sale> select1YearSales(String foodtruckId);
	List<Sale> select10DaysSales(String foodtruckId);
	
}
