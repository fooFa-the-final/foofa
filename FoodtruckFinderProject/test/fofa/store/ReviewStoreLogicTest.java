package fofa.store;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import org.junit.Before;
import org.junit.Test;

import fofa.domain.Member;
import fofa.domain.Review;
import fofa.store.logic.ReviewStoreLogic;

public class ReviewStoreLogicTest {

	private ReviewStore store;
	
	@Before
	public void setUp(){
		store = new ReviewStoreLogic();
	}
	@Test
	public void testInsert() {
		Review review = new Review();
		review.setContents("짱짱");
		review.setFoodtruckId("F11");
		review.setReviewId("R01");
		review.setScore(5);
		Member m = new Member();
		m.setMemberId("momo");
		review.setWriter(m);
		int insert = store.insert(review);
		assertEquals(1, insert);
	}

	@Test
	public void testUpdate() {
		Review review = new Review();
		review.setContents("사실 맛없는데 맛있다고 해준거");
		review.setFoodtruckId("F11");
		review.setReviewId("R01");
		review.setScore(1);
		Member m = new Member();
		m.setMemberId("momo");
		review.setWriter(m);
		int insert = store.insert(review);
		assertEquals(1, insert);
	}

	@Test
	public void testDelete() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectById() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectByMemberId() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectByTruckId() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectByRecommand() {
		fail("Not yet implemented");
	}

}
