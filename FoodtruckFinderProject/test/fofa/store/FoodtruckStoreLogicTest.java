package fofa.store;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import fofa.domain.Foodtruck;
import fofa.store.logic.FoodtruckStoreLogic;

public class FoodtruckStoreLogicTest {
	private FoodtruckStore store = new FoodtruckStoreLogic();

//	@Test
//	public void testInsert() {
//		Foodtruck foodtruck = new Foodtruck();
//		foodtruck.setSellerId("nacho");
//		foodtruck.setFoodtruckName("t");
//		foodtruck.setFoodtruckImg("t");
//		foodtruck.setOperationTime("t");
//		foodtruck.setSpot("t");
//		foodtruck.setNotice("t");
//		foodtruck.setLocation("t");
//		foodtruck.setCategory1("t");
//		foodtruck.setCard(true);
//		foodtruck.setParking(true);
//		foodtruck.setDrinking(true);
//		foodtruck.setCatering(true);
//		foodtruck.setState(true);
//		
//		assertEquals(1, store.insert(foodtruck));
//	}

	@Test
	public void testUpdate() {
		Foodtruck foodtruck = store.selectById("F12");
		
		foodtruck.setFoodtruckImg("image");
		foodtruck.setFoodtruckName("10000LAB COFFEE");
		
		assertEquals(1, store.update(foodtruck));
	}

	@Test
	public void testSelectById() {
		Foodtruck foodtruck = store.selectById("F1");
		
		assertEquals("안녕하세요", foodtruck.getNotice());
	}

	@Test
	public void testSelectByLoc() {
		List<Foodtruck> list = store.selectByLoc("경기도");
		
		assertEquals(2, list.size());
	}

	@Test
	public void testSelectByKeyLoc() {
		List<Foodtruck> list = store.selectByKeyLoc("candy", "서울");
		
		assertEquals("F11", list.get(0).getFoodtruckId());
	}

	@Test
	public void testSelectByFilter() {
		Foodtruck t = new Foodtruck();
		t.setState(true);
		
		List<Foodtruck> list = store.selectByFilter(t);
		
		assertEquals(4, list.size());
	}

	@Test
	public void testSelectBySellerId() {
		Foodtruck foodtruck = store.selectBySellerId("nacho");
		
		assertEquals("서울 금천구", foodtruck.getSpot());
	}

}
