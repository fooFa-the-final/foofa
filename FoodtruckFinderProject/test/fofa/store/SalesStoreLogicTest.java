package fofa.store;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.fail;

import java.sql.Date;

import org.junit.Test;

import fofa.domain.Sale;
import fofa.store.logic.SalesStoreLogic;

public class SalesStoreLogicTest {

	@Test
	public void testInsert() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdate() {
		fail("Not yet implemented");
	}

	@Test
	public void testDelete() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectDaySale() {
		SalesStore store = new SalesStoreLogic();
		
		Date date = new Date(2017, 01, 01);
		Sale sale = store.selectDaySale(date, "F1");
		
		assertNotNull(sale);
	}

	@Test
	public void testSelect1MonthSales() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelect1YearSales() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelect10DaysSales() {
		fail("Not yet implemented");
	}

}
