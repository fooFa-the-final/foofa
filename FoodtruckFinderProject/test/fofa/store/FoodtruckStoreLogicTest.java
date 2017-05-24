package fofa.store;

import static org.junit.Assert.*;

import org.junit.Test;

import fofa.domain.Foodtruck;
import fofa.store.logic.FoodtruckStoreLogic;

public class FoodtruckStoreLogicTest {
	private FoodtruckStore store = new FoodtruckStoreLogic();

	@Test
	public void testInsert() {
		Foodtruck foodtruck = new Foodtruck();
		foodtruck.setSellerId("t");
		
		assertEquals(1, store.insert(foodtruck));
	}

//	@Test
//	public void testUpdate() {
//		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testSelectById() {
//		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testSelectByLoc() {
//		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testSelectByKeyLoc() {
//		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testSelectByFilter() {
//		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testSelectBySellerId() {
//		fail("Not yet implemented");
//	}

}
