package fofa.store;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.util.List;

import org.junit.Before;
import org.junit.Test;

import fofa.domain.Advertise;
import fofa.store.logic.AdvertiseStoreLogic;

public class AdvertiseStoreTest {

	private AdvertiseStoreLogic store1;

	@Before
	public void setUp() {
		this.store1 = new AdvertiseStoreLogic();
	}

	// @Test
	// public void testInsert() {
	//
	// Advertise advertise = new Advertise();
	// advertise.setPeriod("1");
	// advertise.setStartdate("2222");
	// advertise.setSellerId("nacho");
	// advertise.setApprove(false);
	// assertEquals(1, store1.insert(advertise));
	//
	// }

	//
//	 @Test
//	 public void testSelectByAsc() {
//
//		 assertEquals(4, store1.selectByAsc(1).size());
//
//	 }
	

	@Test
	public void testSelectByDesc() {
		boolean approve1 = true;
		String approve = "0";
		List<Advertise> list = store1.selectByDesc(0);
		assertEquals(4, store1.selectByDesc(0).size());

	}

	// @Test
	// public void testSelectNowAd() {
	//
	// List<Advertise> list = store1.selectNowAd();
	//
	// assertEquals(6, list.size());
	// //광고 불러오기 테스트 완료
	//
	// }

	// @Test
	// public void testInsert() {
	//
	// Advertise advertise = new Advertise();
	// advertise.setPeriod("1");
	// advertise.setStartdate("2222");
	// advertise.setSellerId("nacho");
	// assertEquals(1, store1.insert(advertise));
	//
	// }

	// @Test
	// public void testDelete() {
	// assertEquals(1, store1.delete("A24"));
	// }

//	 @Test
//	 public void testUpdate() {
//		 Advertise advertise = new Advertise();
//		 advertise.setAdvId("A10");
//		 advertise.setApprove(2);
//		 assertEquals(1, store1.update(advertise));
//	 }
//	
//	@Test
//	public void testSelectExpired(){
//		assertEquals(5, store1.selectExpired().size());
//	}
}
