package fofa.service.logic;

import java.sql.Date;
import java.util.List;

import org.apache.catalina.Store;

import fofa.domain.Sale;
import fofa.service.SalesService;
import fofa.store.SalesStore;
import fofa.store.logic.SalesStoreLogic;

public class SalesServiceLogic implements SalesService {
	SalesStore store = null;

	public SalesServiceLogic() {
		store = new SalesStoreLogic();
	}

	@Override
	public boolean register(Sale sale) {
		if (1 == store.insert(sale)) {
			return true;
		}
		return false;
	}

	@Override
	public boolean modify(Sale sale) {
		if (1 == store.update(sale)) {
			return true;
		}
		return false;

	}

	@Override
	public boolean remove(String saleId) {
		if (1 == store.delete(saleId)) {
			return true;
		}
		return false;

	}

	@Override
	public Sale findDateSale(Date date, String foodtruckId) {
		Sale sale = store.selectDaySale(date, foodtruckId);
		return sale;
	}

	@Override
	public List<Sale> find1YearSales(String foodtruckId) {
		List<Sale> list = store.select1YearSales(foodtruckId);
		return list;
	}

	@Override
	public List<Sale> find10DaysSales(String foodtruckId) {
		List<Sale> list = store.select10DaysSales(foodtruckId);
		return list;
	}

	@Override
	public List<Sale> find1MonthSales(String foodtruckId, String month) {
		List<Sale> list = store.select1MonthSales(foodtruckId, month);
		return list;
	}

}
