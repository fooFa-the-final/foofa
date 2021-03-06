package fofa.service.logic;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import fofa.domain.Sale;
import fofa.service.SalesService;
import fofa.store.SalesStore;
import fofa.store.logic.SalesStoreLogic;

@Service
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
	public boolean remove(Sale sale) {
		if (1 == store.delete(sale)) {
			return true;
		}
		return false;

	}

	@Override
	public Sale findDateSale(String date, String foodtruckId) {
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
		System.out.println("서비스단 : "+ list.size());
		return list;
	}

	@Override
	public List<Sale> find1MonthSales(String foodtruckId) {
		List<Sale> list = store.select1MonthSales(foodtruckId);
		return list;
	}

}
