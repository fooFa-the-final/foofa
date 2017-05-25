package fofa.store.logic;

import static org.junit.Assert.*;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;

import fofa.domain.Sale;

public class SaleStoreTest {

	// @Test
	// public void testInsert() {
	//
	// SalesStoreLogic saleLogic = new SalesStoreLogic();
	//
	// Sale sale = new Sale();
	// String date = new Date(15, 12, 12);
	// sale.setDate(date);
	// sale.setFoodtruckId("20");
	// sale.setLocation("여기rl");
	// sale.setRevenue(1000000);
	//
	// assertEquals(saleLogic.insert(sale), 1);
	//
	// }

	// @Test
	// public void testUpdate() {
	// SalesStoreLogic saleLogic = new SalesStoreLogic();
	//
	// Sale sale = new Sale();
	// 
	// sale.setDate("111111");
	// sale.setSalesId("1");
	// sale.setDate(date);
	// sale.setFoodtruckId("11");
	// sale.setLocation("여기");
	// sale.setRevenue(10000);
	//
	// saleLogic.update(sale);
	// }

	// @Test
	// public void testDelete() {
	// SalesStoreLogic saleLogic = new SalesStoreLogic();
	//
	// String saleId = "1";
	//
	// saleLogic.delete(saleId);
	// }
	//
	// @Test
	// public void testSelectDaySale() {
	// SalesStoreLogic saleLogic = new SalesStoreLogic();
	//
	// String date = "111111";
	// String foodtruckId = "1";
	//
	// Sale sale = saleLogic.selectDaySale(date, foodtruckId);
	// assertNotNull(sale);
	//
	// }

	//
	// @Test
	// public void testSelect1MonthSales() {
	// SalesStoreLogic saleLogic = new SalesStoreLogic();
	//
	// List<Sale> list = saleLogic.select1MonthSales("1", "1601");
	//
	// assertNotNull(list);
	//
	//
	// }
	// @Test
	// public void testSelect10DaysSales() {
	// SalesStoreLogic saleLogic = new SalesStoreLogic();
	// String foodtruckId = "1";
	// List<Sale> list = saleLogic.select10DaysSales(foodtruckId);
	//
	// assertEquals(2, list.size());
	// }
	// @Test
	// public void testSelect1YearSales() {
	// SalesStoreLogic saleLogic = new SalesStoreLogic();
	// String foodtruckId = "1";
	// List<Sale> list = saleLogic.select1YearSales(foodtruckId);
	//
	// assertEquals(2, list.size());
	// }
}
