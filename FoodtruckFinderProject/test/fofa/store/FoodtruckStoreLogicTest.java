package fofa.store;

import static org.junit.Assert.*;

import java.util.HashMap;
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

//	@Test
//	public void testUpdate() {
//		Foodtruck foodtruck = store.selectById("F12");
//		
//		foodtruck.setFoodtruckImg("image");
//		foodtruck.setFoodtruckName("10000LAB COFFEE");
//		
//		assertEquals(1, store.update(foodtruck));
//	}

	@Test
	public void testSelectById() {
		Foodtruck foodtruck = store.selectById("F1");
		
		assertEquals("안녕하세요", foodtruck.getNotice());
	}

	@Test
	public void testSelectByLoc() {
		List<HashMap<String, Object>> list = store.selectByLoc(1, "서울");
		
		assertEquals("sampleTruck106", list.get(0).get("foodtruckName"));
		assertEquals("485", list.get(0).get("allCount"));
	}

//	@Test
//	public void testSelectByKeyLoc() {
//		List<Foodtruck> list = store.selectByKeyLoc(1, "", "서울");
//		
//		assertEquals(10, list.size());
//	}

//	@Test
//	public void testSelectByFilter() {
//		Foodtruck t = new Foodtruck();
//		t.setState(false);
//		
//		
//		List<HashMap<String, String>> list = store.selectByFilter(1, t, "favoriteCount");
//		
//		assertEquals(10, list.size());
//	}

	@Test
	public void testSelectBySellerId() {
		Foodtruck foodtruck = store.selectBySellerId("nacho");
		
		assertEquals("서울 금천구", foodtruck.getSpot());
	}

}
