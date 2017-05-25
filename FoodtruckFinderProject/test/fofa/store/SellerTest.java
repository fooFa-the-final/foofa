package fofa.store;

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

	// @Test
	// public void testInsert() {
	// Seller seller = new Seller();
	// seller.setCertification("12");
	// seller.setPassword("1");
	// seller.setPhone("1");
	// seller.setSellerId("4");
	// store1.insert(seller);
	// assertEquals(1, store1.insert(seller));
//	}

	// @Test
	// public void testUpdate() {
	// fail("Not yet implemented");
	// }
	//
	 @Test
	 public void testDelete() {
	
	
	 String as = "as";
	
	 store1.delete(as);
	
	 }
	//
	@Test
	public void testSelect() {
		String id = "as";
		int insert = 0;
		 store1.delete(id);

	}

}
