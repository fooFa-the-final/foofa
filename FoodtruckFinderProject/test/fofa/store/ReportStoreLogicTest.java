package fofa.store;

import static org.junit.Assert.*;

import java.util.List;

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
	}
	
	@Test
	public void selectTest(){
		Report r = new Report();
		r.setMemberId("memberid1");
		r.setReviewId("R01");
//		r = rStore.selectById(r);
		assertEquals("신기하게 이놈 리뷰만 보면 화가 치밀어오름", r.getReason());
	}
	
	@Test
	public void selectAllTest(){
		List<Report> list = rStore.selectAll();
		assertEquals(2, list.size());
	}
}
