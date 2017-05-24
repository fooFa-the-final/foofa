package fofa.store;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import fofa.domain.Report;
import fofa.store.logic.ReportStoreLogic;

public class ReportStoreLogicTest {

	private ReportStore rStore;
	@Before
	public void setUp(){
		rStore = new ReportStoreLogic();
	}
	
	@Test
	public void insertTest() {
		Report r = new Report();
		r.setMemberId("d1");
		r.setReason("짜증짜증");
		r.setReviewId("R01");
		int insert = rStore.insert(r);
		assertEquals(1, insert);
	}
	@Test
	public void deleteTest() {
		Report r = new Report();
		r.setMemberId("d1");
		r.setReviewId("R01");
		int delete = rStore.delete(r);
		assertEquals(1, delete);
	}
}
