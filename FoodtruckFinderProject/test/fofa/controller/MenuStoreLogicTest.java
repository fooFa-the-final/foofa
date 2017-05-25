package fofa.controller;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import fofa.domain.Menu;
import fofa.store.MenuStore;
import fofa.store.logic.MenuStoreLogic;

public class MenuStoreLogicTest {
	private MenuStore store = new MenuStoreLogic();

//	@Test
//	public void testInsert() {
//		Menu menu = new Menu();
//		menu.setMenuName("testMenuName5");
//		menu.setPrice(12000);
//		menu.setMenuState(true);
//		menu.setFoodtruckId("F1");
//		
//		assertEquals(1, store.insert(menu));
//	}

	@Test
	public void testUpdate() {
		Menu menu = new Menu();
		menu.setMenuId("M14");
		menu.setMenuName("testMenuName3");
		menu.setPrice(5000);
		menu.setMenuState(false);
		menu.setFoodtruckId("F1");
		
		assertEquals(1, store.update(menu));
	}

//	@Test
//	public void testDelete() {
//		assertEquals(1, store.delete("M15", "F1"));
//	}

	@Test
	public void testSelectByTruckId() {
		List<Menu> list = store.selectByTruckId("F2");
		assertEquals(3, list.size());
	}

}
