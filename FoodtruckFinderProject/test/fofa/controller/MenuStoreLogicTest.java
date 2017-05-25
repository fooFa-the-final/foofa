package fofa.controller;

import static org.junit.Assert.*;

import org.junit.Test;

import fofa.domain.Menu;
import fofa.store.MenuStore;
import fofa.store.logic.MenuStoreLogic;

public class MenuStoreLogicTest {
	private MenuStore store = new MenuStoreLogic();

	@Test
	public void testInsert() {
		Menu menu = new Menu();
		menu.setMenuName("testMenuName");
		menu.setPrice(10000);
		menu.setFoodtruckId("F1");
		
		assertEquals(1, store.insert(menu));
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
	public void testSelectByTruckId() {
		fail("Not yet implemented");
	}

}
