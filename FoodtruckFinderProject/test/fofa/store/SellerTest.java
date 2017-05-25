package fofa.store;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import fofa.domain.Menu;
import fofa.store.MenuStore;
import fofa.store.logic.MenuStoreLogic;

import org.junit.Before;
import org.junit.Test;

import fofa.domain.Seller;
import fofa.store.logic.SellerStoreLogic;

public class SellerTest {

	private SellerStoreLogic store1;

	@Before
	public void setUp() {
		this.store1 = new SellerStoreLogic();
	}

	// @Test
	// public void testSellerStoreLogic() {
	// fail("Not yet implemented");
	// }



//	 @Test
//	 public void testUpdate() {
//
//		 
//		 Seller seller = new Seller();
//		 seller.setCertification("12");
//		 seller.setPassword("31");
//		 seller.setPhone("1");
//		 seller.setSellerId("as");
//
//		assertEquals(1, store1.update(seller));
//	 
//	 }
	 
	 
//	 @Test
//	 public void testDelete() {
//	
//	
//	 String as = "as";
//	
//	 store1.delete(as);
//	
//	 }
	//
//	@Test
//	public void testSelect() {
//		String id = "as";
//		int insert = 0;
//		 store1.delete(id);
//
//	}

	 
//	 @Test
//	 public void testInsert() {
//	 Seller seller = new Seller();
//	 seller.setCertification("12");
//	 seller.setPassword("1");
//	 seller.setPhone("1");
//	 seller.setSellerId("dddd4");
//	 assertEquals(1, store1.insert(seller));
//	}
	 
}
