package fofa.store;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import fofa.domain.Sale;

public interface SalesStore {

	int insert(Sale sale);

	int update(Sale sale);

	int delete(String saleId);

	Sale selectDaySale(Date date, String foodtruckId);

	List<Sale> select1YearSales(String foodtruckId);

	List<Sale> select10DaysSales(String foodtruckId);

	List<Sale> select1MonthSales(String foodtruckId, String month);

}
