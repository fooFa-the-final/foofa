package fofa.service;

import java.sql.Date;
import java.util.List;

import fofa.domain.Sale;

public interface SalesService {

	boolean register(Sale sale);

	boolean modify(Sale sale);

	boolean remove(String saleId);

	Sale findDateSale(String date, String foodtruckId);

	List<Sale> find1YearSales(String foodtruckId);

	List<Sale> find10DaysSales(String foodtruckId);

	List<Sale> find1MonthSales(String foodtruckId, String month);

}
