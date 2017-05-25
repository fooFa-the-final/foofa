package fofa.store;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import fofa.domain.Favorite;
import fofa.store.logic.FavoriteStoreLogic;

public class FavoriteStoreLogicTest {
	private FavoriteStore store = new FavoriteStoreLogic();

//	@Test
//	public void testInsert() {
//		Favorite favorite = new Favorite();
//		favorite.setFoodtruckId("F11");
//		favorite.setMemberId("momo");
//		
//		assertEquals(1, store.insert(favorite));
//	}

//	@Test
//	public void testDelete() {
//		Favorite favorite = new Favorite();
//		favorite.setFoodtruckId("F11");
//		favorite.setMemberId("momo");
//		
//		assertEquals(1, store.delete(favorite));
//	}

	@Test
	public void testSelectByMemberId() {
		List<Favorite> list = store.selectByMemberId("momo");
		
		assertEquals(3, list.size());
	}

	@Test
	public void testSelectByTruckId() {
		int count = store.selectByTruckId("F1");
		
		assertEquals(3, count);
	}

}
