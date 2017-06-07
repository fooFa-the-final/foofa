package fofa.store;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import fofa.domain.Sale;

public interface SalesStore {

	int insert(Sale sale);

	int update(Sale sale);

	int delete(Sale sale);

	Sale selectDaySale(String date, String foodtruckId);

	List<Sale> select1YearSales(String foodtruckId);

	List<Sale> select10DaysSales(String foodtruckId);

	List<Sale> select1MonthSales(String foodtruckId);

}
