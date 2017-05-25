package fofa.store.mapper;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import fofa.domain.Sale;

public interface SalesMapper {

	int insert(Sale sale);
	int update(Sale sale);
	int delete(String saleId);
	Sale selectDaySale(Sale sale);
	List<Sale> select1MonthSales(Map<String, String> map);
	List<Sale> select1YearSales(String foodtruckId);
	List<Sale> select10DaysSales(String foodtruckId);
}